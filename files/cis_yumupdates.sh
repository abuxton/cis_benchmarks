#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 1.2.5

# confine kernel to Redhat


UPDATES=`yum check-update | grep el7`


if [[ $UPDATES ]] 
then	
	echo "yum updates are available"
fi

