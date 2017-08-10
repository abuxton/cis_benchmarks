#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.11


ARR="["

for i in $(cut -s -d: -f4 /etc/passwd | sort -u );
do
	grep -q -P "^.*?:x:$i:" /etc/group

	if [ $? -ne 0 ]; then
		ARR="${ARR}'${i}',"
	fi
done

ARR=`echo ${ARR::-1}]`

if [ $ARR != "]" ]
then
        echo $ARR
fi
