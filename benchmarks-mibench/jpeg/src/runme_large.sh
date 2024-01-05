#!/bin/sh
/usr/bin/time ./cjpeg -dct int -progressive -opt -outfile output_large_encode.jpeg ../data/input_large.ppm > output_large_encode.out 2> output_large_encode.err
/usr/bin/time ./djpeg -dct int -ppm -outfile output_large_decode.ppm ../data/input_large.jpg > output_large_decode.out 2> output_large_decode.err

../../grep_time_mem.sh output_large_encode.err output_large_decode.err
