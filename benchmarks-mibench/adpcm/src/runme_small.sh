#!/bin/sh
/usr/bin/time ./rawcaudio < ../data/small.pcm > output_small.adpcm 2> output_small.adpcm.err
/usr/bin/time ./rawdaudio < ../data/small.adpcm > output_small.pcm 2> output_small.pcm.err

../../grep_time_mem.sh output_small.adpcm.err output_small.pcm.err
