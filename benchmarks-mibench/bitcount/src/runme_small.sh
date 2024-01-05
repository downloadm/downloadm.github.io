#!/bin/sh
/usr/bin/time ./bitcnts 75000 > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
