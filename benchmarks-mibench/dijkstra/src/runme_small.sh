#!/bin/sh
/usr/bin/time ./dijkstra_small ../data/input.dat > output_small.dat 2> output_small.err

../../grep_time_mem.sh output_small.err
