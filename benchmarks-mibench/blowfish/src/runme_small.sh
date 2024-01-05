#!/bin/sh
/usr/bin/time ./bf e ../data/input_small.asc output_small.enc 1234567890abcdeffedcba0987654321 > output_small.enc.out 2> output_small.enc.err
/usr/bin/time ./bf d output_small.enc output_small.asc 1234567890abcdeffedcba0987654321 > output_small.asc.out 2> output_small.asc.err

../../grep_time_mem.sh output_small.enc.err output_small.asc.err
