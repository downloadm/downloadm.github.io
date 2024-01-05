#!/bin/sh
/usr/bin/time ./dijkstra_large ../data/input.dat > output_large.dat 2> output_large.err

../../grep_time_mem.sh output_large.err
