IGN_FILES := src/toast_alaw.c src/toast_ulaw.c

GCC_OPTS = \
  -I$(OUTPUT_DIR)/inc \
  -D_POSIX_C_SOURCE=200801 \
  -DNeedFunctionPrototypes=1 \
  -DSASR \
  -DSTUPID_COMPILER

ERROR_FILES := output_RUNTYPE.au.gsm.err output_RUNTYPE.au.run.err

include ../../Makefile.default.acc
