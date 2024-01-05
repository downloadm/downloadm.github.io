MORE_ACXX_OPTS = \
  --isystem "$(INPUT__DIR)_temp" \
  -D__NO_MATH_INLINES \
  -DHAVEMPGLIB \
  -DLAMEPARSE \
  -DNDEBUG \
  -DLAMESNDFILE \
  -DBRHIST

# Get all the files and the source files in the input directory.
ALL_FILES = $(sort $(shell find $(INPUT__DIR) -type f))
SRC_FILES = $(sort $(shell find $(INPUT__DIR) -type f -name *.h) \
                   $(shell find $(INPUT__DIR) -type f -name *.c) \
                   $(shell find $(INPUT__DIR) -type f -name *.ah))
# Set the files to be ignored in instrumentation:
# all the non-source files, and some special source files.
IGN_FILES = $(patsubst $(INPUT__DIR)/%, $(INPUT__DIR)_temp/%, \
              $(filter-out $(SRC_FILES), $(ALL_FILES))) \
            $(patsubst %, $(INPUT__DIR)_temp/%, \
              debugscalefac.c gpkplotting.h mp3x.c \
              Dll/BladeMP3EncDLL.c Dll/BladeMP3EncDLL.h)
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

ERROR_FILES := output_RUNTYPE.err

include ../../Makefile.default.acxx
