#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 1.2.6


PKG=`rpm -qVa | awk '$2 != "c" { print $0}'`


if [[ $PKG ]]
then
	ARR="["

	for i in $PKG
	do
		ARR="${ARR}'${i}',"
	done

	# remove last comma
	ARR=`echo ${ARR::-1}]`

	# echo facter
	if [ $ARR != "]" ]
	then
        echo $ARR > /etc/.mtn_cis_pkg_integrity
	fi

fi
