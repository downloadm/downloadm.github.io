#!/bin/sh
/usr/bin/time ./bf e ../data/input_large.asc output_large.enc 1234567890abcdeffedcba0987654321 > output_large.enc.out 2> output_large.enc.err
/usr/bin/time ./bf d output_large.enc output_large.asc 1234567890abcdeffedcba0987654321 > output_large.asc.out 2> output_large.asc.err

../../grep_time_mem.sh output_large.enc.err output_large.asc.err
