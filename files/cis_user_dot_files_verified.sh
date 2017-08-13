#!/bin/bash
# 6.2.10 Ensure users' dot files are not group or world writable (Scored)
for dir in `cat /etc/passwd | egrep -v '(root|sync|halt|shutdown)' | awk -F: '($7 != "/sbin/nologin") { print $6 }'`; do
  for file in $dir/.[A-Za-z0-9]*; do
    if [ ! -h "$file" -a -f "$file" ]; then
      fileperm=`ls -ld $file | cut -f1 -d" "`
      if [ `echo $fileperm | cut -c6` != "-" ]; then echo "Group Write permission set on file $file"
      fi
      if [ `echo $fileperm | cut -c9`  != "-" ]; then
        echo "Other Write permission set on file $file"
      fi
    fi
  done
done
