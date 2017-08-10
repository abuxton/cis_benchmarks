#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.14


/bin/cat /etc/passwd | /bin/cut -f3 -d":" | /bin/sort -n | /usr/bin/uniq -c |\
while read x ; do
[ -z "${x}" ] && break
set - $x
if [ $1 -gt 1 ]; then

	users=`/bin/gawk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | /usr/bin/xargs`


if [[ $users ]] 
then	
	ARR="["
	
	for i in $users
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


fi
done

