#!/bin/sh
/usr/bin/time ./gs -sDEVICE=ppm -dNOPAUSE -q -sOutputFile=output_large.ppm -- ../data/large.ps > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
