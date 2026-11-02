LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE work.base_pack.ALL;
USE work.f8_pack.ALL;

ENTITY test_boot IS
  GENERIC (image_file, res1_file, res2_file : string;
           expander_file : string := "";
           serial_file : string := "";
           fast_console : boolean := false;
           save_pc, restore_pc : natural := 0;
           keyloop_pc, put_pc, newline_pc : natural;
           inject_input : boolean := false;
           matrix_input : boolean := false;
           trace_banks : boolean := false;
           trace_input : boolean := false;
           max_clocks : natural := 2000000;
           commands : string := "PRINT 2+3*4" & character'val(13) &
             "PRINT (2+3)*4" & character'val(13) & "10 PRINT ""OK""" & character'val(13) &
             "RUN" & character'val(13);
           expected_output : string := "";
           loop_iterations : natural := 0;
           require_sorry : boolean := false);
END ENTITY;

ARCHITECTURE test OF test_boot IS
  SIGNAL clk : std_logic := '0';
  SIGNAL ce : std_logic;
  SIGNAL reset_na : std_logic := '0';
  SIGNAL dr, dw, rdata, wdata, acc, io_addr, io_data : uv8;
  SIGNAL romc : uv5;
  SIGNAL phase : uint4;
  SIGNAL addr : unsigned(13 DOWNTO 0);
  SIGNAL rd, wr, io_rd : std_logic;
  SIGNAL pc0, pc1 : uv16;
  SIGNAL dc0 : uv16;
  SIGNAL isar : uv6;
  SIGNAL flags : uv5;
  SIGNAL dl_addr : uv16 := (OTHERS => '0');
  SIGNAL dl_data, dl_index : uv8 := (OTHERS => '0');
  SIGNAL dl_wr : std_logic := '0';
  SIGNAL vpos : unsigned(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL count : natural := 0;
  FUNCTION key_value(value : character) RETURN natural IS
  BEGIN
    IF matrix_input THEN
      CASE value IS
        WHEN 'I' => RETURN 1;
        WHEN 'S' => RETURN 30;
        WHEN OTHERS => RETURN 0;
      END CASE;
    END IF;
    IF value = '~' THEN RETURN 13; END IF;
    RETURN character'pos(value);
  END FUNCTION;
  SIGNAL input_pos : natural RANGE 1 TO commands'length + 1 := 1;
  SIGNAL po_a_n, po_b_n, pi_b_n, smi_data, io_wdata : uv8;
  SIGNAL io_wr, int_req, int_ack, smi_ce : std_logic;
  SIGNAL int_vector : uv16;
  SIGNAL exp_data_n, exp_clock_n, exp_irq_n : std_logic := '1';
  SIGNAL printer_txd, modem_txd : std_logic;
  SIGNAL serial_armed : boolean := false;
  SIGNAL serial_output : string(1 TO 2048);
  SIGNAL serial_length : natural := 0;
BEGIN
  clk <= NOT clk AFTER 5 ns;
  ce <= '1' WHEN count MOD 4 = 0 ELSE '0';
  io_data <= smi_data WHEN io_addr >= 12 AND io_addr <= 15 ELSE
    to_unsigned(key_value(commands(input_pos)), 8) WHEN input_pos <= commands'length ELSE x"00";
  pi_b_n <= po_b_n AND unsigned'('1' & exp_clock_n & exp_data_n & "11111");
  cpu : ENTITY work.f8_cpu PORT MAP (
    clk => clk, ce => ce, reset_na => reset_na, dr => dr, dw => dw,
    dv => OPEN, romc => romc, tick => OPEN, phase => phase,
    po_a_n => po_a_n, pi_a_n => po_a_n, po_b_n => po_b_n, pi_b_n => pi_b_n,
    port1_wr => OPEN, intreq => int_req, acco => acc, visaro => isar, iozcso => flags);
  busif : ENTITY work.f8_busif PORT MAP (
    clk => clk, ce => ce, reset_na => reset_na, dw => dw, dr => dr,
    dv => OPEN, romc => romc, tick => '0', phase => phase,
    ext_addr => addr, ext_rd => rd, ext_wr => wr, ext_wdata => wdata,
    ext_rdata => rdata, ext_req => OPEN, ext_class => OPEN, ext_grant => '1',
    io_addr => io_addr, io_rd => io_rd, io_wr => io_wr, io_wdata => io_wdata,
    io_rdata => io_data, int_vector => int_vector, int_ack => int_ack,
    pc0o => pc0, pc1o => pc1, dc0o => dc0);
  smi_ce <= ce WHEN phase MOD 2 = 1 ELSE '0';
  smi : ENTITY work.f3853 PORT MAP (
    clk => clk, reset_na => reset_na, ce => smi_ce,
    io_addr => io_addr, io_rd => io_rd, io_wr => io_wr, io_wdata => io_wdata,
    io_rdata => smi_data, io_sel => OPEN, ext_int => NOT exp_irq_n,
    int_req => int_req, int_vector => int_vector, int_ack => int_ack);
  expander : ENTITY work.expander1 PORT MAP (
    clk => clk, reset_na => reset_na,
    host_data_n => po_b_n(5), host_clock_n => po_b_n(6),
    data_n => exp_data_n, clock_n => exp_clock_n, interrupt_n => exp_irq_n,
    record_data => OPEN, record_enable => OPEN, playback_enable => OPEN,
    modem_txd => modem_txd, printer_txd => printer_txd,
    dl_addr => dl_addr, dl_data => dl_data, dl_wr => dl_wr, dl_index => dl_index);
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
              WHEN OTHERS => value := 16#12#;
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
        -- Language-only checks retain register save/restore and skip rendering.
        IF index = 2 AND fast_console AND
           ((n >= 5*2048 + put_pc - 4096 AND n < 5*2048 + put_pc - 4096 + 7) OR
            (n >= 5*2048 + newline_pc - 4096 AND n < 5*2048 + newline_pc - 4096 + 7)) THEN
          IF n < 5*2048 + newline_pc - 4096 THEN
            value := n - (5*2048 + put_pc - 4096);
          ELSE
            value := n - (5*2048 + newline_pc - 4096);
          END IF;
          CASE value IS
            WHEN 0 => value := 16#08#;
            WHEN 1 => value := 16#28#;
            WHEN 2 => value := save_pc / 256;
            WHEN 3 => value := save_pc MOD 256;
            WHEN 4 => value := 16#29#;
            WHEN 5 => value := restore_pc / 256;
            WHEN OTHERS => value := restore_pc MOD 256;
          END CASE;
        END IF;
        IF index = 0 AND matrix_input AND n >= 16#361# AND n < 16#364# THEN
          CASE n IS
            WHEN 16#361# => value := 16#A2#;
            WHEN 16#362# => value := 16#58#;
            WHEN OTHERS => value := 16#1C#;
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
    IF expander_file /= "" THEN load(expander_file, 3); END IF;
    reset_na <= '1';
    WAIT;
  END PROCESS;

  PROCESS
    TYPE binary_file IS FILE OF character;
    FILE capture : binary_file;
    CONSTANT bit_time : time := ((1 sec / 300) / 69841278) * 10000000;
    VARIABLE value : uv8;
    VARIABLE length : natural := 0;
  BEGIN
    IF expander_file = "" THEN WAIT; END IF;
    IF serial_file /= "" THEN file_open(capture, serial_file, write_mode); END IF;
    WAIT UNTIL serial_armed;
    LOOP
      WAIT UNTIL falling_edge(printer_txd);
      WAIT FOR bit_time / 2;
      ASSERT printer_txd = '0' REPORT "Serial start bit missing" SEVERITY failure;
      FOR i IN 0 TO 7 LOOP
        WAIT FOR bit_time;
        value(i) := printer_txd;
        ASSERT modem_txd = printer_txd REPORT "Serial routes differ" SEVERITY failure;
      END LOOP;
      WAIT FOR bit_time;
      ASSERT printer_txd = '1' REPORT "Serial stop bit missing" SEVERITY failure;
      length := length + 1;
      serial_output(length) <= character'val(to_integer(value));
      serial_length <= length;
      IF serial_file /= "" THEN write(capture, character'val(to_integer(value))); END IF;
    END LOOP;
  END PROCESS;

  PROCESS(clk)
    TYPE ram_t IS ARRAY(0 TO 4095) OF uv8;
    VARIABLE ram : ram_t := (OTHERS => x"00");
    VARIABLE objects : ram_t := (OTHERS => x"00");
    VARIABLE symbols : uv8 := x"00";
    VARIABLE bank : natural := 0;
    VARIABLE output : string(1 TO 1024);
    VARIABLE output_len : natural := 0;
    VARIABLE pending_char : boolean := false;
    VARIABLE loop_count : natural := 0;
    VARIABLE loop_depth : uv8 := x"00";
    VARIABLE serial_pos : natural;
    PROCEDURE append(value : natural) IS
    BEGIN
      output_len := output_len + 1;
      ASSERT output_len <= output'length REPORT "Output overflow" SEVERITY failure;
      output(output_len) := character'val(value);
    END PROCEDURE;
    IMPURE FUNCTION contains(needle : string) RETURN boolean IS
      VARIABLE matched : boolean;
      VARIABLE value : character;
    BEGIN
      FOR i IN 1 TO output_len - needle'length + 1 LOOP
        matched := true;
        FOR j IN needle'range LOOP
          value := needle(j);
          IF value = '~' THEN value := character'val(13); END IF;
          IF output(i + j - needle'low) /= value THEN
            matched := false;
            EXIT;
          END IF;
        END LOOP;
        IF matched THEN RETURN true; END IF;
      END LOOP;
      RETURN false;
    END FUNCTION;
  BEGIN
    IF rising_edge(clk) THEN
      count <= count + 1;
      vpos <= to_unsigned((count / 8) MOD 262, 9);
      IF reset_na = '1' THEN
        IF io_rd = '1' AND io_addr = 2 AND input_pos <= commands'length THEN
          IF matrix_input THEN
            IF input_pos = 5 THEN
              ASSERT symbols = 1 AND objects(16#30#) = 2
                REPORT "Incorrect symbol mode or cursor height" SEVERITY failure;
            ELSIF input_pos = 1 OR input_pos = 9 THEN
              ASSERT symbols = 0 AND objects(16#30#) = 1
                REPORT "Incorrect letter mode or cursor height" SEVERITY failure;
            END IF;
          END IF;
          input_pos <= input_pos + 1;
        END IF;
        IF wr = '1' THEN
          IF addr = 16#3FFC# AND wdata = 1 THEN serial_armed <= true; END IF;
          IF addr >= 16#0800# AND addr < 16#0890# THEN
            objects(to_integer(addr) - 16#0800#) := wdata;
          END IF;
          IF addr = 16#0FE2# THEN symbols := wdata; END IF;
          IF addr = 16#17FF# THEN
            bank := to_integer(wdata(2 DOWNTO 0));
            IF trace_banks THEN
              REPORT "Bank " & integer'image(bank) & " PC " & work.base_pack.to_hstring(pc0) &
                " target " & work.base_pack.to_hstring(ram(16#F00#)) &
                " depth " & work.base_pack.to_hstring(ram(16#F1D#));
            END IF;
          END IF;
          IF addr >= 16#3000# THEN ram(to_integer(addr(11 DOWNTO 0))) := wdata; END IF;
          IF addr = 16#3FA1# AND pending_char THEN
            append(to_integer(wdata)); pending_char := false;
            IF loop_iterations > 0 AND input_pos > commands'length AND wdata = character'pos('X') THEN
              IF loop_count = 0 THEN loop_depth := ram(16#F1D#); END IF;
              ASSERT ram(16#F1D#) = loop_depth
                REPORT "Bank stack grows across GOTO iterations" SEVERITY failure;
              loop_count := loop_count + 1;
              IF loop_count = loop_iterations THEN
                REPORT "Native F8 GOTO loop keeps constant bank stack depth";
                std.env.stop;
              END IF;
            END IF;
          END IF;
        END IF;
        IF ce = '1' AND phase = 1 AND romc = ROMC_00 THEN
          IF trace_input AND input_pos > commands'length AND bank < 5 AND
             pc0 >= 16#1000# AND pc0 < 16#1800# THEN
            REPORT "CPU bank " & integer'image(bank) & " PC " & work.base_pack.to_hstring(pc0) &
              " A " & work.base_pack.to_hstring(acc) & " DC " & work.base_pack.to_hstring(dc0) &
              " IS " & work.base_pack.to_hstring(resize(isar, 8)) &
              " W " & work.base_pack.to_hstring(resize(flags, 8));
          END IF;
          IF bank = 5 AND pc0 = put_pc THEN pending_char := true; END IF;
          IF bank = 5 AND pc0 = newline_pc THEN append(13); END IF;
          IF NOT inject_input AND NOT matrix_input AND bank = 6 AND pc0 = keyloop_pc THEN
            ASSERT symbols = 0 REPORT "Startup is not in letter mode" SEVERITY failure;
            ASSERT objects(0) = 16#F8# AND objects(16#10#) = 16#F7#
              REPORT "Cursor bitmap pointer overwritten during refresh" SEVERITY failure;
            ASSERT objects(16#30#) = 1 REPORT "Incorrect letter cursor height" SEVERITY failure;
            ASSERT contains("READY") REPORT "READY prompt missing" SEVERITY failure;
            ASSERT contains("TINY BASIC ENHANCED 1.0" & character'val(13) & "3072 BYTES FREE")
              REPORT "Startup memory banner missing" SEVERITY failure;
            ASSERT ram(16#FF0#) = 3 AND ram(16#FF1#) = 1
              REPORT "Incorrect input cursor" SEVERITY failure;
            REPORT "Native F8 startup reached keyboard with READY and prompt";
            std.env.stop;
          ELSIF (inject_input OR matrix_input) AND bank = 6 AND pc0 = 16#1000# AND input_pos > commands'length THEN
            IF expander_file /= "" THEN
              ASSERT serial_armed REPORT "Serial initialization failed" SEVERITY failure;
              serial_pos := 1;
              FOR i IN 1 TO output_len LOOP
                ASSERT serial_pos <= serial_length AND serial_output(serial_pos) = output(i)
                  REPORT "Serial transcript differs at " & integer'image(serial_pos) SEVERITY failure;
                serial_pos := serial_pos + 1;
                IF output(i) = character'val(13) THEN
                  ASSERT serial_pos <= serial_length AND serial_output(serial_pos) = character'val(10)
                    REPORT "Serial LF missing" SEVERITY failure;
                  serial_pos := serial_pos + 1;
                END IF;
              END LOOP;
              ASSERT serial_pos = serial_length + 1 REPORT "Extra serial bytes" SEVERITY failure;
            END IF;
            ASSERT objects(0) = 16#F8# AND objects(16#10#) = 16#F7#
              REPORT "Cursor bitmap pointer " & work.base_pack.to_hstring(objects(16#10#)) &
                work.base_pack.to_hstring(objects(0)) SEVERITY failure;
            REPORT output(1 TO output_len);
            IF require_sorry THEN
              ASSERT contains("SORRY") REPORT "SORRY path was not exercised" SEVERITY failure;
            END IF;
            IF expected_output'length > 0 THEN
              ASSERT contains(expected_output) REPORT "Expected output missing" SEVERITY failure;
            ELSE
              ASSERT contains("14" & character'val(13)) REPORT "Arithmetic precedence failed" SEVERITY failure;
              ASSERT contains("20" & character'val(13)) REPORT "Parentheses failed" SEVERITY failure;
              ASSERT contains("OK" & character'val(13)) REPORT "Stored RUN failed" SEVERITY failure;
            END IF;
            REPORT "Native F8 input and output passed";
            std.env.stop;
          END IF;
        END IF;
        ASSERT count < max_clocks
          REPORT "Startup timeout: PC " & integer'image(to_integer(pc0)) & " bank " & integer'image(bank) &
            " depth " & work.base_pack.to_hstring(ram(16#F1D#)) &
            " transfer " & work.base_pack.to_hstring(ram(16#E42#)) & work.base_pack.to_hstring(ram(16#E43#)) &
            " output " & output(1 TO output_len) SEVERITY failure;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE;
