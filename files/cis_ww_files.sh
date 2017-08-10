#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.1.10

FILES=`df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002`

if [[ $FILES ]]; then
	ARR="["

	for i in $FILES
	do
		ARR="${ARR}'${i}',"
	done

	# remove last comma
	ARR=`echo ${ARR::-1}]`

	# echo facter
	if [ $ARR != "]" ]
	then
        echo $ARR
	fi

fi

