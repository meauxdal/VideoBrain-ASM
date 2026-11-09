#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"
"${DASM:-dasm}" TimingBaseline.asm -f3 -oTimingBaseline.bin -lTimingBaseline.lst -sTimingBaseline.sym
"${DASM:-dasm}" TimingScreen.asm -f3 -oTimingScreen.bin -lTimingScreen.lst -sTimingScreen.sym
