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
build=${TBE_TAPE_BUILD:-"$source_dir/../../build/tinybasic/banked"}
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
        "-gexpected_program_end=$program_end" "-gexpected_duplicate_bytes=$duplicate_bytes" "-gfail_duplicate_write=$fail_write" \
        "-gpreserve_tape_program=$preserve" "-gexpected_tape_ok=$ok" --ieee-asserts=disable --assert-level=error
}
result=0
for name in ${TBE_TAPE_CASES:-roundtrip multiple empty crc magic length program offset missing-expander veri veri-multiple veri-empty veri-crc veri-magic veri-length veri-program veri-offset veri-line-end veri-line-long comp comp-multiple comp-empty comp-data comp-length comp-crc dupe dupe-multiple dupe-empty dupe-crc dupe-header dupe-program dupe-late-crc dupe-write-error}; do
    duplicate_bytes=-1
    fail_write=false
    preserve=false
    ok=false
    fault=0
    error=false
    program_end=-1
    image="$build/tinybasic-tape-codec.test.bin"
    codec=true
    case $name in
        dupe*)
            preserve=true
            ok=true
            duplicate_bytes=-2
            program='10 PRINT "TAPE PASS"~'
            case $name in
                dupe-multiple) program='10 PRINT "FIRST"~20 REM XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~30 PRINT "SECOND"~' ;;
                dupe-empty) program='' ;;
                dupe-crc) fault=1; error=true; ok=false; duplicate_bytes=0 ;;
                dupe-header) fault=2; error=true; ok=false; duplicate_bytes=0 ;;
                dupe-program) fault=6; error=true; ok=false; duplicate_bytes=0 ;;
                dupe-late-crc)
                    program='10 PRINT "FIRST"~20 REM XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~30 PRINT "SECOND"~'
                    fault=8; error=true; ok=false; duplicate_bytes=68 ;;
                dupe-write-error) fail_write=true; error=true; ok=false; duplicate_bytes=68 ;;
            esac
            commands="NEW~${program}SAVE~NEW~10 PRINT \"UNCHANGED\"~DUPE~LIST~"
            expected='~10 PRINT "UNCHANGED"~' ;;
        veri*|comp*)
            preserve=true
            ok=true
            operation=VERI
            case $name in comp*) operation=COMP ;; esac
            program='10 PRINT "TAPE PASS"~'
            current=''
            case $name in
                *-multiple) program='10 PRINT "FIRST"~20 REM XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~30 PRINT "SECOND"~' ;;
                veri-line-long) program='10 PRINT "FIRST"~20 REM XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX~30 PRINT "SECOND"~'; fault=7; error=true; ok=false ;;
                *-empty) program='' ;;
                veri) current='NEW~10 PRINT "UNCHANGED"~' ;;
                comp-data) current='10 PRINT "DIFFERENT"~'; error=true; ok=false ;;
                comp-length) current='20 PRINT "EXTRA"~'; error=true; ok=false ;;
                *-crc) fault=1; error=true; ok=false ;;
                *-magic) fault=2; error=true; ok=false ;;
                *-length) fault=3; error=true; ok=false ;;
                *-program) fault=4; error=true; ok=false ;;
                *-offset) fault=5; error=true; ok=false ;;
                *-line-end) fault=6; error=true; ok=false ;;
                *-line-long) fault=7; error=true; ok=false ;;
            esac
            commands="NEW~${program}SAVE~${current}${operation}~LIST~PRINT \"RECOVER\"~"
            expected='~RECOVER~'
            case $name in veri) expected='~10 PRINT "UNCHANGED"~' ;; esac ;;
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
