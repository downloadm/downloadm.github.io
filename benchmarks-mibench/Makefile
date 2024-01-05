# You can use one of the two following ways to init DIRS.
# 1. Search for all sub-directories.
DIRS := $(sort $(shell ls -d */))
# 2. Designate a set of sub-directories.
# DIRS := adpcm/ basicmath/ bitcount/ CRC32/ dijkstra/

IGN_DIRS := 0_common/
DIRS := $(filter-out $(IGN_DIRS), $(DIRS))

BUILDS := $(patsubst %/, %/build, $(DIRS))
SMALLS := $(patsubst %/, %/small, $(DIRS))
LARGES := $(patsubst %/, %/large, $(DIRS))
CLEANS := $(patsubst %/, %/clean, $(DIRS))

.PHONY: build $(BUILDS) small $(SMALLS) large $(LARGES) clean $(CLEANS)

build: $(BUILDS)

$(BUILDS): %/build: %/src
	@$(MAKE) -C $<

small: $(SMALLS)

$(SMALLS): %/small: %/src %/build
	@echo "Running" $(patsubst %/small, %, $@) "on small ..."
	@if [ -z "$${BENCHMARK_RUN_TIMES}" ]; then \
	     export BENCHMARK_COUNT_DOWN=1; \
	 else \
	     export BENCHMARK_COUNT_DOWN="$${BENCHMARK_RUN_TIMES}"; \
	     echo "==== Run $${BENCHMARK_RUN_TIMES} times ===="; \
	 fi; \
	 cd $<; \
	 while [ $${BENCHMARK_COUNT_DOWN} -ge 1 ]; do \
	     ./runme_small.sh; \
	     export BENCHMARK_COUNT_DOWN=`expr $${BENCHMARK_COUNT_DOWN} - 1`; \
	 done;

large: $(LARGES)

$(LARGES): %/large: %/src %/build
	@echo "Running" $(patsubst %/large, %, $@) "on large ..."
	@if [ -z "$${BENCHMARK_RUN_TIMES}" ]; then \
	     export BENCHMARK_COUNT_DOWN=1; \
	 else \
	     export BENCHMARK_COUNT_DOWN="$${BENCHMARK_RUN_TIMES}"; \
	     echo "==== Run $${BENCHMARK_RUN_TIMES} times ===="; \
	 fi; \
	 cd $<; \
	 while [ $${BENCHMARK_COUNT_DOWN} -ge 1 ]; do \
	     ./runme_large.sh; \
	     export BENCHMARK_COUNT_DOWN=`expr $${BENCHMARK_COUNT_DOWN} - 1`; \
	 done;

clean: $(CLEANS)

$(CLEANS): %/clean: %/src
	@$(MAKE) -C $< clean

-include Makefile.inc.movec-monitor

-include Makefile.inc.acc

-include Makefile.inc.acxx
