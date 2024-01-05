#!/bin/bash
# Grep the reported messages from the files in arguments.
# Sum up the number of the reported messages.

total_file=0;
message_cnt=0;
empty_file=0;
nonex_file=0;

for file in $*; do
  total_file=$(expr ${total_file} + 1)
  if [ -s ${file} ]; then
    lines=$(cat ${file} | grep -E "\[MSG:.*\]")
    while [[ -n ${lines} ]]; do
      after=${lines#*\[MSG:} # Get the string after "[MSG:"
      if [ "${after}" == "${lines}" ]; then
        break; # No "[MSG:" found, i.e., no more messages
      fi
      messg=${after%%\]*}  # Get the message before "]"
      lines=${after#*\]}   # Get the remaining lines after "]"
      if [ "${messg}" != "${lines}" ]; then # Add the message
        if [[ -n ${message} ]]; then message=${message}";"; fi
        message=${message}${messg}
        message_cnt=$(expr ${message_cnt} + 1)
      fi
    done
  elif [ -f ${file} ]; then
    empty_file=$(expr ${empty_file} + 1)
  else
    nonex_file=$(expr ${nonex_file} + 1)
  fi
done

if [ "${message_cnt}" != "0" ]; then
    echo "#### Reported ${message_cnt} messages:${message}"
elif [ "${empty_file}" != "0" ]; then
    echo "#### No message is recorded."
    echo "#### You need to manually check"\
         "as ${empty_file}/${total_file} output files are empty."
else
    echo "#### No message is reported."
fi
if [ "${nonex_file}" != "0" ]; then
    echo "#### ${nonex_file}/${total_file} output files do not exist."
fi

# Write to the specified file.
if [ -n "${BENCHMARK_TABLE_FILE}" ]; then
  echo -n "\"${message}\"," >> ${BENCHMARK_TABLE_FILE}
fi
