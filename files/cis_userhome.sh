#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.13


ARR="["

cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' |\

### using subshell wrapper () to get ARR variable out of the while loop
(while read user uid dir; do

if [ $uid -ge 1000 -a -d "$dir" -a $user != "nfsnobody" ]; then
owner=$(stat -L -c "%U" "$dir")
	if [ "$owner" != "$user" ]; then

		ARR="${ARR}'${dir}:${owner}',"

	fi
fi
done

ARR=`echo ${ARR::-1}]`

if [ $ARR != "]" ]
then
        echo $ARR
fi)
