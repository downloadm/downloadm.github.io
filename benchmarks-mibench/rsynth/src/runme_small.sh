#!/bin/sh
/usr/bin/time ./say -a -q -o small_output.au < ../data/smallinput.txt > small_output.out 2> small_output.err

../../grep_time_mem.sh small_output.err
