#!/bin/sh
# validate user home perms
# 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)
for dir in `cat /etc/passwd | egrep -v '(root|halt|sync|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do
  dirperm=`ls -ld $dir | cut -f1 -d" "`
  if [ `echo $dirperm | cut -c6`  != "-" ]; then
echo "Group Write permission set on directory $dir" fi
if [ `echo $dirperm | cut -c8` != "-" ]; then
echo "Other Read permission set on directory $dir"
  fi
  if [ `echo $dirperm | cut -c9`  != "-" ]; then
echo "Other Write permission set on directory $dir" fi
  if [ `echo $dirperm | cut -c10`  != "-" ]; then
echo "Other Execute permission set on directory $dir" fi
done
