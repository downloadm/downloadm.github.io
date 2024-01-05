#!/bin/sh
/usr/bin/time ./bitcnts 1125000 > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
