#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.5

RESULT=`/bin/cat /etc/passwd | /bin/awk -F: '($3 == 0) { print $1 }' | grep -v root`

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

