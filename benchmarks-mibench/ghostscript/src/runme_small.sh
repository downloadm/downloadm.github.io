#!/bin/sh
/usr/bin/time ./gs -sDEVICE=ppm -dNOPAUSE -q -sOutputFile=output_small.ppm -- ../data/small.ps > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
