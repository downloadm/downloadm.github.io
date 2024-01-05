#!/bin/sh
/usr/bin/time ./susan ../data/input_large.pgm output_large.smoothing.pgm -s > output_large1.out 2> output_large1.err
/usr/bin/time ./susan ../data/input_large.pgm output_large.edges.pgm -e > output_large2.out 2> output_large2.err
/usr/bin/time ./susan ../data/input_large.pgm output_large.corners.pgm -c > output_large3.out 2> output_large3.err

../../grep_time_mem.sh output_large1.err output_large2.err output_large3.err
