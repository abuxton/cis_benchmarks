#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.19, 9.2.20

FILE=$1

ARR="["

(for dir in `/bin/cat /etc/passwd |\
/bin/awk -F: '{ print $6 }'`; do

	if [ ! -h "$dir/${FILE}" -a -f "$dir/${FILE}" ]; then
		
		ARR="${ARR}'${dir}',"
	fi

done

ARR=`echo ${ARR::-1}]`

if [ $ARR != "]" ]
then
        echo $ARR
fi)
