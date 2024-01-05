#!/bin/sh
/usr/bin/time ./crc ../../adpcm/data/small.pcm > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
