#!/bin/sh
set -eu

if [ "$#" -ne 4 ]; then
    echo 'Usage: test_serial.sh CORE_DIRECTORY RES1_ROM RES2_ROM EXPANDER_ROM' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
expander=$(realpath "$4")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
image=$(realpath "$source_dir/../../build/tinybasic/banked/tinybasic-24x15.bin")
cd "$core/verilator"
work=out/tinybasic-serial
mkdir -p "$work"
ghdl -a --std=08 --workdir="$work" \
    ../rtl/f8/base_pack.vhd ../rtl/f8/f8_pack.vhd ../rtl/uv202/uv202_pack.vhd \
    ../rtl/f8/f8_cpu.vhd ../rtl/uv202/f8_busif.vhd ../rtl/f3853.vhd \
    ../rtl/f3870_timer.vhd ../rtl/expander1.vhd ../rtl/uv201/uv201_regs.vhd \
    ../rtl/buffered_bus.vhd ../rtl/cartridge_loader.vhd ../rtl/sys_bus.vhd \
    "$source_dir/test_boot.vhd"
put=$(awk '$1 == "CON_PUT" {print $2}' "$source_dir/../../build/tinybasic/banked/console.sym")
newline=$(awk '$1 == "CON_NEWLINE" {print $2}' "$source_dir/../../build/tinybasic/banked/console.sym")
run() {
    ghdl -r --std=08 --workdir="$work" test_boot \
        "-gimage_file=$image" "-gres1_file=$res1" "-gres2_file=$res2" \
        -gkeyloop_pc=4105 "-gput_pc=$((0x$put))" "-gnewline_pc=$((0x$newline))" \
        -gmax_clocks=1000000000 "$@" --ieee-asserts=disable --assert-level=error
}
run > "$work/no-expander.log" 2>&1
run "-gexpander_file=$expander" "-gserial_file=$work/output.bin" \
    -ginject_input=true '-gcommands=PRINT 2+3~' '-gexpected_output=     5~' \
    > "$work/serial.log" 2>&1
run "-gexpander_file=$expander" "-gserial_file=$work/mixed-print.bin" \
    -ginject_input=true '-gcommands=PRINT "TOTAL ",7+3~' '-gexpected_output=TOTAL     10~' \
    > "$work/mixed-print.log" 2>&1
