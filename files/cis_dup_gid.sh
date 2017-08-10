#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.15


/bin/cat /etc/group | /bin/cut -f3 -d":" | /bin/sort -n | /usr/bin/uniq -c |\
while read x ; do
[ -z "${x}" ] && break
set - $x

if [ $1 -gt 1 ]; then

	grps=`/bin/gawk -F: '($3 == n) { print $1 }' n=$2 /etc/group | xargs`

	if [[ $grps ]] 
	then	
		ARR="["
	
		for i in $grps
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


