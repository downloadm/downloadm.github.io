#!/bin/sh
/usr/bin/time ./rijndael ../data/input_large.asc output_large.enc e 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321 > output_large1.out 2> output_large1.err
/usr/bin/time ./rijndael output_large.enc output_large.dec d 1234567890abcdeffedcba09876543211234567890abcdeffedcba0987654321 > output_large2.out 2> output_large2.err

../../grep_time_mem.sh output_large1.err output_large2.err
