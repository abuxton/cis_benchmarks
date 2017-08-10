#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.16

defUsers="root bin daemon adm lp sync shutdown halt mail news uucp operator games
gopher ftp nobody nscd vcsa rpc mailnull smmsp pcap ntp dbus avahi sshd rpcuser
nfsnobody haldaemon avahi-autoipd distcache apache oprofile webalizer dovecot squid
named xfs gdm sabayon usbmuxd rtkit abrt saslauth pulse postfix tcpdump"

ARR="["

cat /etc/passwd | awk -F: '($3 < 500) { print $1" "$3 }' |\

### using subshell wrapper () to get ARR variable out of the while loop

(while read user uid; do
	found=0
	
	for tUser in ${defUsers}
	do
		if [ ${user} = ${tUser} ]; then
			found=1
		fi
	done


	if [ $found -eq 0 ]; then
		ARR="${ARR}'${user}:${uid}',"

	fi
done

ARR=`echo ${ARR::-1}]`

if [ $ARR != "]" ]
then
        echo $ARR
fi)
