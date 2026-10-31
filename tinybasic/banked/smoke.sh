#!/bin/sh
set -eu

if [ "$#" -ne 3 ]; then
    echo 'Usage: smoke.sh CORE_DIRECTORY RES1_ROM RES2_ROM' >&2
    exit 2
fi

core=$(realpath "$1")
res1=$(realpath "$2")
res2=$(realpath "$3")
source_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
assembly=$(realpath "$source_dir/../..")
output="$core/verilator/out/tinybasic24"
mkdir -p "$output"
trap 'result=$?; printf "Simulation exit: %s\n" "$result"' EXIT
test -f "$res1"
test -f "$res2"
test -f "$assembly/build/tinybasic/banked/tinybasic-24x15.bin"
python3 "$core/tools/keyboard_input.py" "$source_dir/smoke.txt" \
    --profile tinybasic --start-mode letters --output "$output/smoke.vbk"
cd "$core/verilator"
make headless
./obj_dir_headless/Vtop --res1 "$res1" --res2 "$res2" \
    --cart "$assembly/build/tinybasic/banked/tinybasic-24x15.bin" \
    --cart-type 6 --source "$output/smoke.vbk@180" --source-trace \
    --frames 2600 --shot 180,900,1700 --shot-last --scale 3 \
    --dump 180,900,1700,2599 --ram --dump-file "$output/state.txt" \
    --outdir "$output" --prefix tinybasic24
echo 'Simulation completed; review captures for 1, -1, 14, 20 and RUN output 1, 2, 3.'
