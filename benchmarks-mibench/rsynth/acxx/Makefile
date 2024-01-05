TARGETS := say

MORE_ACXX_OPTS = \
  --isystem "$(INPUT__DIR)_temp"

# Get all the files and the source files in the input directory.
ALL_FILES = $(sort $(shell find $(INPUT__DIR) -type f))
SRC_FILES = $(sort $(shell find $(INPUT__DIR) -type f -name *.h) \
                   $(shell find $(INPUT__DIR) -type f -name *.c) \
                   $(shell find $(INPUT__DIR) -type f -name *.def) \
                   $(shell find $(INPUT__DIR) -type f -name *.ah))
# Set the files to be ignored in instrumentation:
# all the non-source files, and some special source files.
IGN_FILES = $(patsubst $(INPUT__DIR)/%, $(INPUT__DIR)_temp/%, \
              $(filter-out $(SRC_FILES), $(ALL_FILES))) \
            $(patsubst %, $(INPUT__DIR)_temp/%, \
              config/dummyplay.c config/hpuxplay.c config/linuxplay.c  \
              config/naplay.c    config/NeXTplay.c config/pipeplay.c   \
              config/sgiplay.c   config/sunplay.c  config/sunplay_mm.c \
              dlookup.c hplay.c mkdictdb.c naplay.c Revision.c)
# Move the ignored files to the output directory before instrumentation.
INPTMP_DIR_NAME = $(shell basename $(INPUT__DIR)_temp)
OUTPUT_DIR_NAME = $(shell basename $(OUTPUT_DIR))
PRE_INSTR_CMDS = \
  for file in $(IGN_FILES); do \
    tmp_dir=$${file%/*}; \
    dst_dir=`echo "$${tmp_dir}" | sed 's/$(INPTMP_DIR_NAME)/$(OUTPUT_DIR_NAME)/'`; \
    mkdir -p $${dst_dir}; \
    $(MOVE) $${file} $${dst_dir}; \
  done; \
  $(COPY) $(INPUT__DIR)_temp/*.def $(OUTPUT_DIR)

ERROR_FILES := RUNTYPE_output.err

include ../../Makefile.default.acxx
