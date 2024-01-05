#!/bin/sh
/usr/bin/time ./qsort_large ../data/input_large.dat > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
