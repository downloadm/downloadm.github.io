MORE_ACXX_OPTS = \
  --isystem "$(OUTPUT_DIR)" \
  -DMAX_ALLOC_CHUNK=65520L \
  -DSTDC_HEADERS

# Get all the files and the source files in the input directory.
ALL_FILES = $(sort $(shell find $(INPUT__DIR) -type f))
SRC_FILES = $(sort $(shell find $(INPUT__DIR) -type f -name *.c) \
                   $(shell find $(INPUT__DIR) -type f -name *.h) \
                   $(shell find $(INPUT__DIR) -type f -name *.ah))
# Set the files to be ignored in instrumentation:
# all the non-source files, and some special source files.
IGN_FILES = $(patsubst $(INPUT__DIR)/%, $(INPUT__DIR)_temp/%, \
              $(filter-out $(SRC_FILES), $(ALL_FILES))) \
            $(patsubst %, $(INPUT__DIR)_temp/%, \
              example.c jdct.h jmemdos.c jmemmac.c)
# Move the ignored files to the output directory before instrumentation.
INPTMP_DIR_NAME = $(shell basename $(INPUT__DIR)_temp)
OUTPUT_DIR_NAME = $(shell basename $(OUTPUT_DIR))
PRE_INSTR_CMDS = \
  for file in $(IGN_FILES); do \
    tmp_dir=$${file%/*}; \
    dst_dir=`echo "$${tmp_dir}" | sed 's/$(INPTMP_DIR_NAME)/$(OUTPUT_DIR_NAME)/'`; \
    mkdir -p $${dst_dir}; \
    $(MOVE) $${file} $${dst_dir}; \
  done;

ERROR_FILES := output_RUNTYPE_encode.err output_RUNTYPE_decode.err

include ../../Makefile.default.acxx
