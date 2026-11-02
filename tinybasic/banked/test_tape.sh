#!/bin/sh
set -eu

if [ "$#" -ne 3 ]; then
    echo 'Usage: test_tape.sh CORE_DIRECTORY RES1_ROM RES2_ROM' >&2
    echo 'Run prepare_tape_test.py before this script.' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build="$source_dir/../../build/tinybasic/banked"
cd "$core/verilator"
work=${TBE_TAPE_WORK:-out/tinybasic-tape}
mkdir -p "$work"
ghdl -a --std=08 --workdir="$work" \
    ../rtl/f8/base_pack.vhd ../rtl/f8/f8_pack.vhd ../rtl/uv202/uv202_pack.vhd \
    ../rtl/f8/f8_cpu.vhd ../rtl/uv202/f8_busif.vhd ../rtl/f3853.vhd \
    ../rtl/f3870_timer.vhd ../rtl/expander1.vhd ../rtl/uv201/uv201_regs.vhd \
    ../rtl/buffered_bus.vhd ../rtl/cartridge_loader.vhd ../rtl/sys_bus.vhd \
    "$source_dir/test_boot.vhd"
symbol() { awk -v name="$1" '$1 == name {print $2}' "$build/console.sym"; }
run() {
    ghdl -r --std=08 --workdir="$work" test_boot \
        "-gimage_file=$image" \
        "-gres1_file=$res1" "-gres2_file=$res2" \
        -gkeyloop_pc=4105 "-gput_pc=$((0x$(symbol CON_PUT)))" \
        "-gnewline_pc=$((0x$(symbol CON_NEWLINE)))" \
        "-gsave_pc=$((0x$(symbol C_SAVE)))" "-grestore_pc=$((0x$(symbol C_RESTORE)))" \
        -gfast_console=true -ginject_input=true "-gtape_codec_test=$codec" \
        -gmax_clocks=150000000 "-gcommands=$commands" "-gexpected_output=$expected" \
        "-gtape_fault=$fault" "-gexpected_tape_error=$error" \
        "-gexpected_program_end=$program_end" --ieee-asserts=disable --assert-level=error
}
result=0
for name in ${TBE_TAPE_CASES:-roundtrip multiple empty crc magic length program offset missing-expander}; do
    fault=0
    error=false
    program_end=-1
    image="$build/tinybasic-tape-codec.test.bin"
    codec=true
    case $name in
        roundtrip)
            commands='NEW~10 PRINT "TAPE PASS"~SAVE~NEW~LOAD~LIST~RUN~'
            expected='~TAPE PASS~' ;;
        multiple)
            commands='NEW~10 PRINT "FIRST"~20 REM XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~30 PRINT "SECOND"~SAVE~NEW~LOAD~RUN~'
            expected='~FIRST~SECOND~' ;;
        empty)
            commands='NEW~SAVE~10 PRINT "BAD"~LOAD~LIST~PRINT "EMPTY"~'
            expected='~EMPTY~'
            program_end=12288 ;;
        missing-expander)
            image="$build/tinybasic-tape-timeout.test.bin"
            codec=false
            commands='NEW~SAVE~LOAD~PRINT "RECOVER"~'
            expected='~RECOVER~'
            error=true
            program_end=12288 ;;
        *)
            commands='NEW~10 PRINT "TAPE PASS"~SAVE~NEW~LOAD~LIST~PRINT "RECOVER"~'
            expected='~RECOVER~'
            error=true
            program_end=12288
            case $name in
                crc) fault=1 ;;
                magic) fault=2 ;;
                length) fault=3 ;;
                program) fault=4 ;;
                offset) fault=5 ;;
            esac ;;
    esac
    if run > "$work/$name.log" 2>&1; then
        echo "$name passed"
    else
        echo "$name failed"
        result=1
    fi
done
exit "$result"
