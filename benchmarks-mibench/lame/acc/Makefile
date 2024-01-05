IGN_FILES := Dll/BladeMP3EncDLL.c debugscalefac.c ieeefloat.c mp3x.c tables.c

GCC_OPTS = \
  -I$(OUTPUT_DIR) \
  -D__NO_MATH_INLINES \
  -DBRHIST \
  -DHAVEMPGLIB \
  -DLAMEPARSE \
  -DLAMESNDFILE \
  -DNDEBUG

ERROR_FILES := output_RUNTYPE.err

include ../../Makefile.default.acc
