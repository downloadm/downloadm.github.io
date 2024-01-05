#!/bin/sh
/usr/bin/time ./search_large > output_large.out 2> output_large.err

../../grep_time_mem.sh output_large.err
