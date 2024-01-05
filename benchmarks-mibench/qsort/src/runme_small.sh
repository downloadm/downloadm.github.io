#!/bin/sh
/usr/bin/time ./qsort_small ../data/input_small.dat > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
