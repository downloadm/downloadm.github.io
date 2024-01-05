#!/bin/sh
/usr/bin/time ./rawcaudio < ../data/large.pcm > output_large.adpcm 2> output_large.adpcm.err
/usr/bin/time ./rawdaudio < ../data/large.adpcm > output_large.pcm 2> output_large.pcm.err

../../grep_time_mem.sh output_large.adpcm.err output_large.pcm.err
