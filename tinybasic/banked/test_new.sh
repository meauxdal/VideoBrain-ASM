#!/bin/sh
set -eu

if [ "$#" -ne 3 ]; then
    echo 'Usage: test_new.sh CORE_DIRECTORY RES1_ROM RES2_ROM' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build="$source_dir/../../build/tinybasic/banked"
cd "$core/verilator"
work=out/tinybasic-new
mkdir -p "$work"
ghdl -a --std=08 --workdir="$work" \
    ../rtl/f8/base_pack.vhd ../rtl/f8/f8_pack.vhd ../rtl/uv202/uv202_pack.vhd \
    ../rtl/f8/f8_cpu.vhd ../rtl/uv202/f8_busif.vhd ../rtl/f3853.vhd \
    ../rtl/f3870_timer.vhd ../rtl/expander1.vhd ../rtl/uv201/uv201_regs.vhd \
    ../rtl/buffered_bus.vhd ../rtl/cartridge_loader.vhd ../rtl/sys_bus.vhd \
    "$source_dir/test_boot.vhd"
symbol() { awk -v name="$1" '$1 == name {print $2}' "$build/console.sym"; }
ghdl -r --std=08 --workdir="$work" test_boot \
    "-gimage_file=$build/tinybasic-24x15.bin" "-gres1_file=$res1" "-gres2_file=$res2" \
    -gkeyloop_pc=4105 "-gput_pc=$((0x$(symbol CON_PUT)))" \
    "-gnewline_pc=$((0x$(symbol CON_NEWLINE)))" \
    "-gsave_pc=$((0x$(symbol C_SAVE)))" "-grestore_pc=$((0x$(symbol C_RESTORE)))" \
    -gfast_console=true -ginject_input=true -gmax_clocks=150000000 \
    '-gcommands=NEW~NEW~PRINT 2+3*4~PRINT (2+3)*4~10 PRINT "OK"~RUN~NEW~LIST~PRINT "AFTER NEW"~' \
    --ieee-asserts=disable --assert-level=error > "$work/new.log" 2>&1
