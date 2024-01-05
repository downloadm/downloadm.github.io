#!/bin/sh
/usr/bin/time ./rijndael ../data/input_small.asc output_small.enc e 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321 > output_small1.out 2> output_small1.err
/usr/bin/time ./rijndael output_small.enc output_small.dec d 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321 > output_small2.out 2> output_small2.err

../../grep_time_mem.sh output_small1.err output_small2.err
