#!/bin/sh
/usr/bin/time bin/toast -fps -c ../data/small.au > output_small.au.gsm 2> output_small.au.gsm.err
/usr/bin/time bin/untoast -fps -c ../data/small.au.run.gsm > output_small.au.run 2> output_small.au.run.err

../../grep_time_mem.sh output_small.au.gsm.err output_small.au.run.err
