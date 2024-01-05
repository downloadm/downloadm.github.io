#!/bin/sh
/usr/bin/time ./say -a -q -o large_output.au < ../data/largeinput.txt > large_output.out 2> large_output.err

../../grep_time_mem.sh large_output.err
