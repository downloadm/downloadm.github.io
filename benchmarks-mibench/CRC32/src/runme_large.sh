#!/bin/sh
/usr/bin/time ./crc ../../adpcm/data/large.pcm > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
