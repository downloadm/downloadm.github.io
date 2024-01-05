#!/bin/bash
# You may select aspect/monitor files using: PREFIXES="prefix1 prefix2"
# You may use command arguments: small, O1, O2, O3, clean.

## Set the prefixes of aspect/monitor files
PREFIXES=*
for arg in "$@"; do
  if [[ $arg =~ "PREFIXES=" ]]; then PREFIXES=${arg#*PREFIXES=}; fi
done
## Set the RUN type: small or large
RUN="large"
if [[ $* =~ "small" ]]; then RUN="small"; fi
## Set the file prefix
PREF=MiBench-${RUN}
## Set the run times
export BENCHMARK_RUN_TIMES=10

## Set the benchmarks to run
DIRS="adpcm  basicmath  bitcount  blowfish  CRC32  dijkstra  FFT
      ghostscript  gsm  jpeg  lame  patricia  qsort
      rijndael  rsynth  sha  stringsearch  susan  typeset"
## ACC fails on these dirs under -O*
SKIP_DIRS_ACC_On="stringsearch"
SKIP_DIRS_ACC_O3=""
## ACXX fails on these dirs under -O*
SKIP_DIRS_ACXX_On="ghostscript typeset"
SKIP_DIRS_ACXX_O3=""
## Movec-monitor fails on these dirs under -O*
SKIP_DIRS_MOVEC_On=""
SKIP_DIRS_MOVEC_O3=""

## Set the optimization level, e.g., OPTLVL=-O1, OPTLVL=-O2 or OPTLVL=-O3
## The default is empty, i.e., using -O0.
if [[ $* =~ "O1" ]]; then OPTLVL="-O1"; fi
if [[ $* =~ "O2" ]]; then OPTLVL="-O2"; fi
if [[ $* =~ "O3" ]]; then OPTLVL="-O3"; fi
if [ -n ${OPTLVL} ]; then
    ACC_OPTS="O=${OPTLVL}"
    ACXX_OPTS="O=${OPTLVL}"
    MOVEC_OPTLVL="O=${OPTLVL}"
fi

## Set the table file
TABLE_FILE=$(pwd)/table_${PREF}.monitor${OPTLVL}.csv
rm -f ${TABLE_FILE}
export BENCHMARK_TABLE_FILE=${TABLE_FILE}
## Clean the output files
rm -f ${PREF}.original-O3
rm -f ${PREF}.acc${OPTLVL}
rm -f ${PREF}.acxx${OPTLVL}
rm -f ${PREF}.movec-monitor${OPTLVL}
if [[ $* =~ "clean" ]]; then exit; fi

## Write table header
echo "Programs,Original -O3,,ACC ${OPTLVL},,,,,ACXX ${OPTLVL},,,,,Movec ${OPTLVL},,,,," >> ${TABLE_FILE};
echo ",time,mem,time,mem,message,T.R.,M.R.,time,mem,message,T.R.,M.R.,time,mem,message,T.R.,M.R.," >> ${TABLE_FILE};

## Run the original and the tools on each benchmark
line=2
for dir in ${DIRS}; do
    line=`expr $line + 1`;
    echo -n "${dir} ${RUN}," >> ${TABLE_FILE};

    ## Run original -O3
    make ${dir}/clean ;
    make ${dir}/build ;
    make ${dir}/${RUN} >> ${PREF}.original-O3 2>&1 ;
    make ${dir}/clean ;

    ## Run ACC
  if [[ ! ${SKIP_DIRS_ACC_On} =~ ${dir} &&
        !(${SKIP_DIRS_ACC_O3} =~ ${dir} && ${OPTLVL} == "-O3") ]]; then
    make ${dir}/clean-acc ;
    make ${dir}/output-acc ASPECT_PREFIXES=${PREFIXES} ${ACC_OPTS} ;
    make ${dir}/${RUN}-acc >> ${PREF}.acc${OPTLVL} 2>&1 ;
    make ${dir}/clean-acc ;
    echo -n "\"=ROUND(D${line}/B${line},2)\",\"=ROUND(E${line}/C${line},2)\"," >> ${TABLE_FILE};
  else
    echo -n ",,,,," >> ${TABLE_FILE};
  fi

    ## Run ACXX
  if [[ ! ${SKIP_DIRS_ACXX_On} =~ ${dir} &&
        !(${SKIP_DIRS_ACXX_O3} =~ ${dir} && ${OPTLVL} == "-O3") ]]; then
    make ${dir}/clean-acxx ;
    make ${dir}/output-acxx ASPECT_PREFIXES=${PREFIXES} ${ACXX_OPTS} ;
    make ${dir}/${RUN}-acxx >> ${PREF}.acxx${OPTLVL} 2>&1 ;
    make ${dir}/clean-acxx ;
    echo -n "\"=ROUND(I${line}/B${line},2)\",\"=ROUND(J${line}/C${line},2)\"," >> ${TABLE_FILE};
  else
    echo -n ",,,,," >> ${TABLE_FILE};
  fi

    ## Run Movec-monitor
  if [[ ! ${SKIP_DIRS_MOVEC_On} =~ ${dir} ]]; then
    make ${dir}/clean-movec-monitor ;
    make ${dir}/output-movec-monitor MONITOR_PREFIXES=${PREFIXES} ${MOVEC_OPTLVL} ;
    make ${dir}/${RUN}-movec-monitor >> ${PREF}.movec-monitor${OPTLVL} 2>&1 ;
    make ${dir}/clean-movec-monitor ;
    echo -n "\"=ROUND(N${line}/B${line},2)\",\"=ROUND(O${line}/C${line},2)\"," >> ${TABLE_FILE};
  else
    echo -n ",,,,," >> ${TABLE_FILE};
  fi

    echo "" >> ${TABLE_FILE};
done

## Write table
echo "" >> ${TABLE_FILE};
echo "AVERAGE,,,,,,\"=ROUND(AVERAGE(G3:G${line}),2)\",\"=ROUND(AVERAGE(H3:H${line}),2)\",,,,\"=ROUND(AVERAGE(L3:L${line}),2)\",\"=ROUND(AVERAGE(M3:M${line}),2)\",,,,\"=ROUND(AVERAGE(Q3:Q${line}),2)\",\"=ROUND(AVERAGE(R3:R${line}),2)\"," >> ${TABLE_FILE};
line=`expr $line + 2`;
echo "over Movec${OPTLVL},,,,,,\"=ROUND(G${line}/Q${line},2)\",\"=ROUND(H${line}/R${line},2)\",,,,\"=ROUND(L${line}/Q${line},2)\",\"=ROUND(M${line}/R${line},2)\",,,,,,,,," >> ${TABLE_FILE};
