#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.1

RESULT=`/bin/cat /etc/shadow | /bin/awk -F: '($2 == "" ) { print $1 }'`

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

