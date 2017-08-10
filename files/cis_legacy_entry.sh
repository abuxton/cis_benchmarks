#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.2, 9.2.3

RESULT=`/bin/grep '^+:' $1`

if [[ $RESULT ]] 
then	
	ARR="["
	
	for i in $RESULT
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

