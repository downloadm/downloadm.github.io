#!/bin/sh
/usr/bin/time ./susan ../data/input_small.pgm output_small.smoothing.pgm -s > output_small1.out 2> output_small1.err
/usr/bin/time ./susan ../data/input_small.pgm output_small.edges.pgm -e > output_small2.out 2> output_small2.err
/usr/bin/time ./susan ../data/input_small.pgm output_small.corners.pgm -c > output_small3.out 2> output_small3.err

../../grep_time_mem.sh output_small1.err output_small2.err output_small3.err
