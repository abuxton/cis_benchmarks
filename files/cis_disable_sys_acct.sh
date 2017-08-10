#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 7.2


ACCT=`grep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/sbin/nologin") {print}'`


if [[ $ACCT ]] 
then	
	echo $ACCT
fi

