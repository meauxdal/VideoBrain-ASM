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
build=${TBE_EXT_BUILD:-"$source_dir/../../build/tinybasic/banked"}
cd "$core/verilator"
work=${TBE_EXT_WORK:-out/tinybasic-extensions}
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
        "-gfast_console=$fast_console" -ginject_input=true -gmax_clocks=150000000 \
        "-gexpected_text_color=$text_color" "-gexpected_how_count=$how_count" "-gcommands=$1" "-gexpected_output=$2" "-gexpected_background=$3" \
        --ieee-asserts=disable --assert-level=error
}
result=0
for name in ${TBE_EXT_CASES:-aliases boundaries color color-abbreviation color-range text-color text-color-range cls move move-scroll move-range}; do
    text_color=-1
    how_count=-1
    fast_console=true
    case $name in
        cls)
            fast_console=false
            commands='NEW~10 COLOR 4;TCOLOR 17~20 PRINT "OLD"~30 CLS~40 PRINT PEEK(6912),PEEK(3965),PEEK(4016),PEEK(4030)~50 PRINT "CLS OK"~RUN~'
            expected='~     0     0    48   216~CLS OK~'
            background=4
            text_color=17 ;;
        move)
            fast_console=false
            commands='NEW~10 CLS~20 MOVE 23,14~30 X=PEEK(16369);Y=PEEK(16370);R=PEEK(16368)~40 MOVE 0,0~50 PRINT X,Y,R~60 PRINT "MOVE OK"~RUN~'
            expected='~    23     1    14~MOVE OK~'
            background=-1 ;;
        move-scroll)
            fast_console=false
            commands='NEW~10 FOR I=1 TO 20~20 PRINT I~30 NEXT I~40 MOVE 2+5,1+2~50 X=PEEK(16369);Y=PEEK(16370);R=PEEK(16368)~60 Z=PEEK(4016+R)~70 PRINT X,Y,Z~80 PRINT "SCROLL OK"~RUN~'
            expected='     7    12    84~SCROLL OK~'
            background=-1 ;;
        move-range)
            how_count=6
            commands='MOVE -1,0~MOVE 24,0~MOVE 0,-1~MOVE 0,15~MOVE 256,0~MOVE 0,256~MOVE 1~PRINT "RECOVER"~'
            expected='~RECOVER~'
            background=-1 ;;
        aliases)
            commands=$(tr '\n' '~' < "$core/examples/tinybasic-examples/34-relational-aliases.txt" | tr -d '\r')
            expected='~     1     1     0~     1     0     0~     1     1     0~     1     0     0~     1     1     1     1~PASS~DONE~'
            background=-1 ;;
        boundaries)
            commands='PRINT (-32767-1)LT32767,32767GT(-32767-1)~PRINT 2+3 GE 5,2*3 LE 6~PRINT 2GE1,1LT2~PRINT 2>=1,1<=2~'
            expected='~     1     1~     1     1~     1     1~     1     1~'
            background=-1 ;;
        color)
            commands='NEW~10 C. 2+2~20 PRINT "COLOR OK"~30 COLOR 31;PRINT "DONE"~RUN~'
            expected='~COLOR OK~DONE~'
            background=31 ;;
        color-abbreviation)
            commands='C. 31~PRINT "COLOR OK"~'
            expected='~COLOR OK~'
            background=31 ;;
        text-color)
            fast_console=false
            commands='NEW~TCOLOR 1~TC. 10~TC. 24~10 TCOLOR 8+9~20 PRINT "TEXT COLOR OK"~RUN~PRINT "AFTER"~'
            expected='~TEXT COLOR OK~'
            background=-1
            text_color=17 ;;
        text-color-range)
            fast_console=false
            commands='TCOLOR 31~TCOLOR -1~TCOLOR 32~TCOLOR 256~PRINT "RECOVER"~'
            expected='~RECOVER~'
            background=-1
            text_color=31 ;;
        color-pass|text-rainbow|text-intensities|color-combinations|color-scroll)
            fast_console=false
            case $name in
                color-pass) file=38-color-pass; expected='~PASS~'; background=2; text_color=31 ;;
                text-rainbow) file=39-text-rainbow; expected='~RAINBOW DONE~'; background=0; text_color=31 ;;
                text-intensities) file=40-text-intensities; expected='~32 CODES DONE~'; background=0; text_color=31 ;;
                color-combinations) file=41-color-combinations; expected='~COMBINATIONS DONE~'; background=0; text_color=31 ;;
                color-scroll) file=42-color-scroll; expected='~SCROLL DONE~'; background=2; text_color=31 ;;
            esac
            commands=$(tr '\n' '~' < "$core/examples/tinybasic-examples/$file.txt" | tr -d '\r') ;;
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
