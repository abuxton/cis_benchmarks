#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.18

ARR="["

cat /etc/group | cut -f1 -d":" | /bin/sort -n | /usr/bin/uniq -c |\


### using subshell wrapper () to get ARR variable out of the while loop

(while read x ; do
	[ -z "${x}" ] && break
	set - $x
	
	if [ $1 -gt 1 ]; then
		gids=`/bin/gawk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs`
	
		ARR="${ARR}'${2}:${gids}',"
	fi
done

ARR=`echo ${ARR::-1}]`

if [ $ARR != "]" ]
then
        echo $ARR
fi)
