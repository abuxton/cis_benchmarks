#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 1.2.2

## REDHAT ONLY

GPGKEY=`rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey | grep "(release key) <security@redhat.com>"`


if [[ $GPGKEY ]] 
then	
	echo "RedHat GPG Key installed"
else
	echo "RedHat GPG Key is not installed"
fi

