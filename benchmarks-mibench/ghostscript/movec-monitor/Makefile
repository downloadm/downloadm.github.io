COPY_MORE_MAKEFILES = $(COPY) ../src_makefiles/zlib/Makefile $(OUTPUT_DIR)/zlib/Makefile
CUSTOM_TARGETS = $(OUTPUT_DIR)
USE_COMPDB := YES

ERROR_FILES := output_RUNTYPE.err

include ../../Makefile.default.movec-monitor

$(OUTPUT_DIR): $(INPUT__DIR)/compile_commands.json
	$(MOVEC) -p $(INPUT__DIR) -d $(OUTPUT_DIR) $(MOVEC_OPTS) -b $(INPUT__DIR)/compile_commands.json -C $(INPUT__DIR)/ansi2knr.c $(INPUT__DIR)/echogs.c $(INPUT__DIR)/genarch.c $(INPUT__DIR)/genconf.c $(INPUT__DIR)/geninit.c
	@echo "***Successfully instrumented the benchmark."
	$(COPY_MAKEFILES)
	$(COPY_MORE_MAKEFILES)
	export INSTRU_TOOL="gcc $(O)"; $(MAKE) -C $(OUTPUT_DIR)

$(INPUT__DIR)/compile_commands.json:
	cd $(INPUT__DIR) && bear -- make > compile_commands.log 2>&1
