#!/bin/sh
set -eu

if [ "$#" -ne 3 ]; then
    echo 'Usage: test_extensions.sh CORE_DIRECTORY RES1_ROM RES2_ROM' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build="$source_dir/../../build/tinybasic/banked"
cd "$core/verilator"
work=out/tinybasic-extensions
mkdir -p "$work"
ghdl -a --std=08 --workdir="$work" \
    ../rtl/f8/base_pack.vhd ../rtl/f8/f8_pack.vhd ../rtl/uv202/uv202_pack.vhd \
    ../rtl/f8/f8_cpu.vhd ../rtl/f8/f8_busif.vhd ../rtl/f3853.vhd \
    ../rtl/f3870_timer.vhd ../rtl/expander1.vhd ../rtl/uv201/uv201_regs.vhd \
    ../rtl/buffered_bus.vhd ../rtl/cartridge_loader.vhd ../rtl/sys_bus.vhd \
    "$source_dir/test_boot.vhd"
symbol() { awk -v name="$1" '$1 == name {print $2}' "$build/console.sym"; }
run() {
    ghdl -r --std=08 --workdir="$work" test_boot \
        "-gimage_file=$build/tinybasic-24x15.bin" "-gres1_file=$res1" "-gres2_file=$res2" \
        -gkeyloop_pc=4105 "-gput_pc=$((0x$(symbol CON_PUT)))" \
        "-gnewline_pc=$((0x$(symbol CON_NEWLINE)))" \
        "-gsave_pc=$((0x$(symbol C_SAVE)))" "-grestore_pc=$((0x$(symbol C_RESTORE)))" \
        -gfast_console=true -ginject_input=true -gmax_clocks=150000000 \
        "-gcommands=$1" "-gexpected_output=$2" "-gexpected_background=$3" \
        --ieee-asserts=disable --assert-level=error
}
result=0
for name in aliases boundaries color color-range; do
    case $name in
        aliases)
            commands=$(tr '\n' '~' < "$core/examples/tinybasic-examples/34-relational-aliases.txt" | tr -d '\r')
            expected='~     1     1     0~     1     0     0~     1     1     0~     1     0     0~     1     1     1     1~PASS~DONE~'
            background=-1 ;;
        boundaries)
            commands='PRINT (-32767-1)LT32767,32767GT(-32767-1)~PRINT 2+3 GE 5,2*3 LE 6~PRINT 2GE1,1LT2~PRINT 2>=1,1<=2~'
            expected='~     1     1~     1     1~     1     1~     1     1~'
            background=-1 ;;
        color)
            commands='NEW~10 COLOR 2+2~20 PRINT "COLOR OK"~30 COLOR 31;PRINT "DONE"~RUN~'
            expected='~COLOR OK~DONE~'
            background=31 ;;
        color-range)
            commands='COLOR 4~COLOR -1~COLOR 32~COLOR 256~PRINT "RECOVER"~'
            expected='~RECOVER~'
            background=4 ;;
    esac
    if run "$commands" "$expected" "$background" > "$work/$name.log" 2>&1; then
        echo "$name passed"
    else
        echo "$name failed"
        result=1
    fi
done
exit "$result"
