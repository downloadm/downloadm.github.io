#!/bin/sh
/usr/bin/time ./cjpeg -dct int -progressive -opt -outfile output_small_encode.jpeg ../data/input_small.ppm > output_small_encode.out 2> output_small_encode.err
/usr/bin/time ./djpeg -dct int -ppm -outfile output_small_decode.ppm ../data/input_small.jpg > output_small_decode.out 2> output_small_decode.err

../../grep_time_mem.sh output_small_encode.err output_small_decode.err
