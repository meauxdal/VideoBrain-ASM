#!/bin/sh
set -eu

if [ "$#" -ne 4 ]; then
    echo 'Usage: test_save.sh CORE_DIRECTORY RES1_ROM RES2_ROM EXPANDER_ROM' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
expander=$(realpath "$4")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build="$source_dir/../../build/tinybasic/banked"
cd "$core/verilator"
work=${TBE_SAVE_WORK:-out/tinybasic-save}
mkdir -p "$work"
ghdl -a --std=08 --workdir="$work" \
    ../rtl/f8/base_pack.vhd ../rtl/f8/f8_pack.vhd ../rtl/uv202/uv202_pack.vhd \
    ../rtl/f8/f8_cpu.vhd ../rtl/uv202/f8_busif.vhd ../rtl/f3853.vhd \
    ../rtl/f3870_timer.vhd ../rtl/expander1.vhd ../rtl/uv201/uv201_regs.vhd \
    ../rtl/buffered_bus.vhd ../rtl/cartridge_loader.vhd ../rtl/sys_bus.vhd \
    "$source_dir/test_boot.vhd"
symbol() { awk -v name="$1" '$1 == name {print $2}' "$build/console.sym"; }
tape_symbol() { awk -v name="$2" '$1 == name {print $2}' "$build/$1.sym"; }
ghdl -r --std=08 --workdir="$work" test_boot \
    "-gimage_file=$build/tinybasic-24x15.bin" "-gres1_file=$res1" "-gres2_file=$res2" \
    "-gexpander_file=$expander" "-grecord_file=$work/record.csv" \
    "-gserial_file=$work/serial.bin" \
    "-gtrace_tape=${TBE_SAVE_TRACE:-false}" \
    "-gfast_console=${TBE_SAVE_FAST:-false}" "-gcheck_serial=${TBE_SAVE_SERIAL:-true}" \
    "-gfast_tape_delay=${TBE_SAVE_FAST:-false}" \
    "-gtape_status_pc=$((0x$(tape_symbol tape_io T_IRQ_STATUS)))" \
    "-gtape_failed_pc=$((0x$(tape_symbol tape_io T_IRQ_FAILED)))" \
    "-gtape_return_pc=$((0x$(tape_symbol tape_io T_IO_DONE)))" \
    "-gtape_timeout_pc=$((0x$(tape_symbol tape_io T_TIMEOUT)))" \
    "-gtape_irq_return_pc=$((0x$(tape_symbol tape_io T_IRQ_RETURN)))" \
    "-gtape_delay_pc=$((0x$(tape_symbol tape_io T_WRITE) + 3))" \
    "-gtape_caller_pc=$((0x$(tape_symbol tape_core T_TRANSFER_RETURN)))" \
    -gkeyloop_pc=4105 "-gput_pc=$((0x$(symbol CON_PUT)))" \
    "-gnewline_pc=$((0x$(symbol CON_NEWLINE)))" \
    "-gsave_pc=$((0x$(symbol C_SAVE)))" "-grestore_pc=$((0x$(symbol C_RESTORE)))" \
    -ginject_input=true -gmax_clocks=1500000000 -gexpected_tape_ok=true \
    '-gcommands=NEW~10 PRINT "SAVED"~SAVE~PRINT "AFTER SAVE"~' \
    '-gexpected_output=~AFTER SAVE~' --ieee-asserts=disable --assert-level=error \
    > "$work/save.log" 2>&1
