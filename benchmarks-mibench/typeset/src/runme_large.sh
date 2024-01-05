#!/bin/sh
/usr/bin/time ./lout -I include -D data -F font -C maps -H hyph ../data/large.lout > output_large.ps 2> output_large.err
rm -f ../data/large.lout.ld*

../../grep_time_mem.sh output_large.err
