#!/bin/sh
/usr/bin/time ./lout -I include -D data -F font -C maps -H hyph ../data/small.lout > output_small.ps 2> output_small.err
rm -f ../data/small.lout.ld*

../../grep_time_mem.sh output_small.err
