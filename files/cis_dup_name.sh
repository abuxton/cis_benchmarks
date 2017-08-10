#!/bin/sh
# CIS RHEL7 Benchmark
# Rule 9.2.17

defUsers="root bin daemon adm lp sync shutdown halt mail news uucp operator games
gopher ftp nobody nscd vcsa rpc mailnull smmsp pcap ntp dbus avahi sshd rpcuser
nfsnobody haldaemon avahi-autoipd distcache apache oprofile webalizer dovecot squid
named xfs gdm sabayon usbmuxd rtkit abrt saslauth pulse postfix tcpdump"

ARR="["

cat /etc/passwd | cut -f1 -d":" | /bin/sort -n | /usr/bin/uniq -c |\

### using subshell wrapper () to get ARR variable out of the while loop

(while read x ; do
	[ -z "${x}" ] && break
	set - $x
	
	if [ $1 -gt 1 ]; then
		uids=`/bin/gawk -F: '($1 == n) { print $3 }' n=$2 /etc/passwd | xargs`
		#echo "Duplicate User Name ($2): ${uids}"
		ARR="${ARR}'${2}:${uids}',"
	fi


done

ARR=`echo ${ARR::-1}]`

if [ $ARR != "]" ]
then
        echo $ARR
fi)
