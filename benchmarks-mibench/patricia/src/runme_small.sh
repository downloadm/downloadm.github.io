#!/bin/sh
/usr/bin/time ./patricia ../data/small.udp > output_small.out 2> output_small.err

../../grep_time_mem.sh output_small.err
