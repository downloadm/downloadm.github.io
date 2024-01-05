#!/bin/sh
/usr/bin/time bin/toast -fps -c ../data/large.au > output_large.au.gsm 2> output_large.au.gsm.err
/usr/bin/time bin/untoast -fps -c ../data/large.au.run.gsm > output_large.au.run 2> output_large.au.run.err

../../grep_time_mem.sh output_large.au.gsm.err output_large.au.run.err
