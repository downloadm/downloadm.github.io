#!/bin/sh
/usr/bin/time ./lame ../data/small.wav output_small.mp3 > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
