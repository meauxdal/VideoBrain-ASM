#!/bin/sh
set -eu

if [ "$#" -ne 5 ]; then
    echo 'Usage: test_playback.sh CORE_DIRECTORY RES1_ROM RES2_ROM EXPANDER_ROM TAPE_VBT' >&2
    exit 2
fi
core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
expander=$(realpath "$4")
tape=$(realpath "$5")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
build="$source_dir/../../build/tinybasic/banked"
cd "$core/verilator"
work=out/tinybasic-playback
mkdir -p "$work"
limit=${TBE_PLAYBACK_SECONDS:-60}
case "$limit" in
    ''|*[!0-9]*|0*) echo 'TBE_PLAYBACK_SECONDS must be a positive integer without leading zeros' >&2; exit 2 ;;
esac
rm -f "$work/exit-status"
ghdl -a --std=08 --workdir="$work" \
    ../rtl/f8/base_pack.vhd ../rtl/f8/f8_pack.vhd ../rtl/uv202/uv202_pack.vhd \
    ../rtl/f8/f8_cpu.vhd ../rtl/uv202/f8_busif.vhd ../rtl/f3853.vhd \
    ../rtl/f3870_timer.vhd ../rtl/expander1.vhd ../rtl/uv201/uv201_regs.vhd \
    ../rtl/buffered_bus.vhd ../rtl/cartridge_loader.vhd ../rtl/sys_bus.vhd \
    "$source_dir/test_boot.vhd"
symbol() { awk -v name="$1" '$1 == name {print $2}' "$build/console.sym"; }
status=0
timeout --kill-after=5s "${limit}s" ghdl -r --std=08 --workdir="$work" test_boot \
    "-gimage_file=$build/tinybasic-24x15.bin" "-gres1_file=$res1" "-gres2_file=$res2" \
    "-gexpander_file=$expander" "-gplayback_file=$tape" "-gserial_file=$work/serial.bin" \
    -gkeyloop_pc=4105 "-gput_pc=$((0x$(symbol CON_PUT)))" \
    "-gnewline_pc=$((0x$(symbol CON_NEWLINE)))" \
    "-gsave_pc=$((0x$(symbol C_SAVE)))" "-grestore_pc=$((0x$(symbol C_RESTORE)))" \
    -gfast_console=true -ginject_input=true -gmax_clocks=1500000000 \
    '-gcommands=NEW~LOAD~LIST~PRINT "RECOVER"~' \
    '-gexpected_output=~10 LET A=7~' -gexpected_tape_ok=true \
    --ieee-asserts=disable --assert-level=error > "$work/playback.log" 2>&1 || status=$?
printf '%s\n' "$status" > "$work/exit-status"
if [ "$status" -eq 124 ]; then
    echo "Playback exceeded ${limit}s; LOAD remains unverified. Log: $work/playback.log" >&2
fi
exit "$status"
