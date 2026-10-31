LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.base_pack.ALL;
USE work.f8_pack.ALL;

ENTITY test_boot IS
  GENERIC (image_file, res1_file, res2_file : string;
           keyloop_pc, put_pc, newline_pc : natural;
           inject_input : boolean := false);
END ENTITY;

ARCHITECTURE test OF test_boot IS
  SIGNAL clk : std_logic := '0';
  SIGNAL reset_na : std_logic := '0';
  SIGNAL dr, dw, rdata, wdata, acc, io_addr, io_data : uv8;
  SIGNAL romc : uv5;
  SIGNAL phase : uint4;
  SIGNAL addr : unsigned(13 DOWNTO 0);
  SIGNAL rd, wr, io_rd : std_logic;
  SIGNAL pc0, pc1 : uv16;
  SIGNAL dl_addr : uv16 := (OTHERS => '0');
  SIGNAL dl_data, dl_index : uv8 := (OTHERS => '0');
  SIGNAL dl_wr : std_logic := '0';
  SIGNAL vpos : unsigned(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL count : natural := 0;
  CONSTANT commands : string := "PRINT 2+3*4" & character'val(13) &
    "PRINT (2+3)*4" & character'val(13) & "10 PRINT ""OK""" & character'val(13) &
    "RUN" & character'val(13);
  SIGNAL input_pos : natural RANGE 1 TO commands'length + 1 := 1;
BEGIN
  clk <= NOT clk AFTER 5 ns;
  io_data <= to_unsigned(character'pos(commands(input_pos)), 8)
    WHEN input_pos <= commands'length ELSE x"00";
  cpu : ENTITY work.f8_cpu PORT MAP (
    clk => clk, ce => '1', reset_na => reset_na, dr => dr, dw => dw,
    dv => OPEN, romc => romc, tick => OPEN, phase => phase,
    po_a_n => OPEN, pi_a_n => x"FF", po_b_n => OPEN, pi_b_n => x"FF",
    port1_wr => OPEN, intreq => '0', acco => acc, visaro => OPEN, iozcso => OPEN);
  busif : ENTITY work.f8_busif PORT MAP (
    clk => clk, ce => '1', reset_na => reset_na, dw => dw, dr => dr,
    dv => OPEN, romc => romc, tick => '0', phase => phase,
    ext_addr => addr, ext_rd => rd, ext_wr => wr, ext_wdata => wdata,
    ext_rdata => rdata, ext_req => OPEN, ext_class => OPEN, ext_grant => '0',
    io_addr => io_addr, io_rd => io_rd, io_wr => OPEN, io_wdata => OPEN,
    io_rdata => io_data, int_vector => x"0000", int_ack => OPEN,
    pc0o => pc0, pc1o => pc1, dc0o => OPEN);
  memory : ENTITY work.sys_bus PORT MAP (
    clk => clk, reset_na => reset_na, ext_addr => addr, ext_rd => rd,
    ext_wr => wr, ext_wdata => wdata, ext_rdata => rdata,
    bb_addr => (OTHERS => '0'), bb_rdata => OPEN,
    uv_cur_field => '0', uv_cur_vpos => vpos, uv_capture_stb => '0',
    uv_capture_x => (OTHERS => '0'), uv_capture_y => (OTHERS => '0'),
    uv_o_x_zm => OPEN, uv_o_frz => OPEN, uv_o_enb => OPEN, uv_o_int => OPEN,
    uv_o_kbd => OPEN, uv_o_y_zm => OPEN, uv_o_a_b => OPEN, uv_o_yint_ho => OPEN,
    uv_y_int => OPEN, uv_final_mod => OPEN, uv_background => OPEN,
    uv_obj_addr => (OTHERS => '0'), uv_obj_rdata => OPEN,
    dl_addr => dl_addr, dl_data => dl_data, dl_wr => dl_wr, dl_index => dl_index,
    unknown_cart_profile => x"06", apl_hold => OPEN, apl_available => OPEN,
    music_available => OPEN, apl_load_error => OPEN);

  PROCESS
    TYPE binary_file IS FILE OF character;
    FILE image : binary_file;
    VARIABLE byte : character;
    VARIABLE n : natural;
    PROCEDURE load(path : string; index : natural) IS
      VARIABLE value : natural;
    BEGIN
      file_open(image, path, read_mode);
      n := 0;
      dl_index <= to_unsigned(index, 8);
      dl_wr <= '1';
      WHILE NOT endfile(image) LOOP
        read(image, byte);
        value := character'pos(byte);
        -- Enter the cartridge directly; retain BIOS service routines.
        IF index = 0 AND n < 86 THEN
          IF n = 0 THEN value := 16#70#;
          ELSIF n <= 80 THEN
            CASE (n - 1) MOD 10 IS
              WHEN 0 => value := 16#60# + (n - 1) / 10;
              WHEN 1 => value := 16#68#;
              WHEN OTHERS => value := 16#5D#;
            END CASE;
          ELSE
            CASE n IS
              WHEN 81 => value := 16#62#;
              WHEN 82 => value := 16#68#;
              WHEN 83 => value := 16#29#;
              WHEN 84 => value := 16#10#;
              WHEN OTHERS => value := 0;
            END CASE;
          END IF;
        END IF;
        -- Isolate language and bank-return checks from keyboard timing.
        IF index = 2 AND inject_input AND n >= 6*2048 AND n < 6*2048+6 THEN
          CASE n MOD 2048 IS
            WHEN 0 => value := 16#08#;
            WHEN 1 => value := 16#A2#;
            WHEN 2 => value := 16#58#;
            WHEN 3 => value := 16#67#;
            WHEN 4 => value := 16#6F#;
            WHEN OTHERS => value := 16#0C#;
          END CASE;
        END IF;
        dl_addr <= to_unsigned(n, 16);
        dl_data <= to_unsigned(value, 8);
        WAIT UNTIL rising_edge(clk);
        WAIT FOR 1 ns;
        n := n + 1;
      END LOOP;
      file_close(image);
      dl_wr <= '0'; dl_index <= x"FF";
      WAIT UNTIL rising_edge(clk);
      WAIT UNTIL rising_edge(clk);
    END PROCEDURE;
  BEGIN
    load(res1_file, 0);
    load(res2_file, 1);
    load(image_file, 2);
    reset_na <= '1';
    WAIT;
  END PROCESS;

  PROCESS(clk)
    TYPE ram_t IS ARRAY(0 TO 4095) OF uv8;
    VARIABLE ram : ram_t := (OTHERS => x"00");
    VARIABLE bank : natural := 0;
    VARIABLE output : string(1 TO 1024);
    VARIABLE output_len : natural := 0;
    VARIABLE pending_char : boolean := false;
    PROCEDURE append(value : natural) IS
    BEGIN
      output_len := output_len + 1;
      ASSERT output_len <= output'length REPORT "Output overflow" SEVERITY failure;
      output(output_len) := character'val(value);
    END PROCEDURE;
    IMPURE FUNCTION contains(needle : string) RETURN boolean IS
    BEGIN
      FOR i IN 1 TO output_len - needle'length + 1 LOOP
        IF output(i TO i + needle'length - 1) = needle THEN RETURN true; END IF;
      END LOOP;
      RETURN false;
    END FUNCTION;
  BEGIN
    IF rising_edge(clk) THEN
      count <= count + 1;
      vpos <= to_unsigned((count / 8) MOD 262, 9);
      IF reset_na = '1' THEN
        IF io_rd = '1' AND io_addr = 2 AND input_pos <= commands'length THEN
          input_pos <= input_pos + 1;
        END IF;
        IF wr = '1' THEN
          IF addr = 16#17FF# THEN bank := to_integer(wdata(2 DOWNTO 0)); END IF;
          IF addr >= 16#3000# THEN ram(to_integer(addr(11 DOWNTO 0))) := wdata; END IF;
          IF addr = 16#3FA1# AND pending_char THEN
            append(to_integer(wdata)); pending_char := false;
          END IF;
        END IF;
        IF phase = 1 AND romc = ROMC_00 THEN
          IF bank = 5 AND pc0 = put_pc THEN pending_char := true; END IF;
          IF bank = 5 AND pc0 = newline_pc THEN append(13); END IF;
          IF NOT inject_input AND bank = 6 AND pc0 = keyloop_pc THEN
            ASSERT contains("READY") REPORT "READY prompt missing" SEVERITY failure;
            ASSERT ram(16#FF0#) = 2 AND ram(16#FF1#) = 1
              REPORT "Incorrect input cursor" SEVERITY failure;
            REPORT "Native F8 startup reached keyboard with READY and prompt";
            std.env.stop;
          ELSIF inject_input AND bank = 6 AND pc0 = 16#1000# AND input_pos > commands'length THEN
            REPORT output(1 TO output_len);
            ASSERT contains("14" & character'val(13)) REPORT "Arithmetic precedence failed" SEVERITY failure;
            ASSERT contains("20" & character'val(13)) REPORT "Parentheses failed" SEVERITY failure;
            ASSERT contains("OK" & character'val(13)) REPORT "Stored RUN failed" SEVERITY failure;
            REPORT "Native F8 arithmetic and stored RUN passed";
            std.env.stop;
          END IF;
        END IF;
        ASSERT count < 2000000
          REPORT "Startup timeout: PC " & integer'image(to_integer(pc0)) & " bank " & integer'image(bank) &
            " output " & output(1 TO output_len) SEVERITY failure;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE;
