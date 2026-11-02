#!/bin/sh
set -eu

if [ "$#" -lt 3 ] || [ "$#" -gt 4 ]; then
    echo 'Usage: test_print.sh CORE_DIRECTORY RES1_ROM RES2_ROM [all|input]' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
case ${4:-all} in
    all) cases='numeric mixed layout smoke input expression' ;;
    input) cases='input smoke expression' ;;
    *) echo 'Unknown test selection' >&2; exit 2 ;;
esac
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build="$source_dir/../../build/tinybasic/banked"
cd "$core/verilator"
work=out/tinybasic-print
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
        "-gimage_file=$build/tinybasic-24x15.bin" "-gres1_file=$res1" "-gres2_file=$res2" \
        -gkeyloop_pc=4105 "-gput_pc=$((0x$(symbol CON_PUT)))" \
        "-gnewline_pc=$((0x$(symbol CON_NEWLINE)))" \
        "-gsave_pc=$((0x$(symbol C_SAVE)))" "-grestore_pc=$((0x$(symbol C_RESTORE)))" \
        -gfast_console=true -ginject_input=true -gmax_clocks=150000000 \
        "-gcommands=$1" "-gexpected_output=$2" --ieee-asserts=disable --assert-level=error
}
result=0
for name in $cases; do
    case $name in
        numeric) commands='PRINT 7,8~'; expected='~     7     8~' ;;
        mixed) commands='PRINT "TOTAL ",7+3~'; expected='~TOTAL     10~' ;;
        layout)
            commands=$(tr '\n' '~' < "$core/software/3 Keyboard Entry (VBK)/Tiny BASIC/Examples/30-print-layout.txt" | tr -d '\r')
            expected='~ 7 8~AB~AB~    Y~DONE~' ;;
        smoke)
            commands=$(tr '\n' '~' < "$core/software/3 Keyboard Entry (VBK)/Tiny BASIC/Games/00-smoke-test.txt" | tr -d '\r')
            commands="${commands}3~"
            expected='~TOTAL     10~     3~' ;;
        input)
            commands='NEW~10 INPUT B~20 PRINT B~30 PRINT 7+B~RUN~3~'
            expected='~     3~    10~' ;;
        expression)
            commands=$(tr '\n' '~' < "$core/software/3 Keyboard Entry (VBK)/Tiny BASIC/Examples/33-input-expression.txt" | tr -d '\r')
            expected='~    14~    28~' ;;
    esac
    if run "$commands" "$expected" > "$work/$name.log" 2>&1; then
        echo "$name passed"
    else
        echo "$name failed"
        result=1
    fi
done
exit "$result"
