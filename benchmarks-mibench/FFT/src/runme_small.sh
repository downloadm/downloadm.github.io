#!/bin/sh
/usr/bin/time ./fft 4 4096 > output_small.out 2> output_small.err
/usr/bin/time ./fft 4 8192 -i > output_small.inv.out 2> output_small.inv.err

../../grep_time_mem.sh output_small.err output_small.inv.err
