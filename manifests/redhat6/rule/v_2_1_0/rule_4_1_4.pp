# 4.1.4 Ensure events that modify date and time information are collected (Scored)
# 4.1.5 Ensure events that modify user/group information are collected (Scored)
# 4.1.6 Ensure events that modify the system's network environment are collected (Scored)
# 4.1.7 Ensure events that modify the system's Mandatory Access Controls are collected (Scored)
# 4.1.8 Ensure login and logout events are collected (Scored)
# 4.1.9 Ensure session initiation information is collected (Scored)
# 4.1.10 Ensure discretionary access control permission modification events are collected (Scored)
# 4.1.11 Ensure unsuccessful unauthorized file access attempts are collected (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_4_1_4 {
  include ::cis_benchmarks::redhat6::rule::v_2_1_0::rule_4_1
  auditd::rule { '(4.1.4) - Ensure events that modify date and time information are collected (Scored), 64bit':
    content => '-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change',
    order   => 1,
  }
  auditd::rule { '(4.1.4) - Ensure events that modify date and time information are collected (Scored), 32bit':
    content => '-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change,',
    order   => 2,
  }
  auditd::rule { '(4.1.4) check for 64bit clock adjustment syscalls':
    content => '-a always,exit -F arch=b64 -S clock_settime -k time-change',
    order   => 3,
  }
  auditd::rule { '(4.1.4) check for 32bit clock adjustment syscalls':
    content => '-a always,exit -F arch=b32 -S clock_settime -k time-change',
    order   => 4,
  }
  auditd::rule { '(4.1.4) watch for changes to the local time file':
    content => '-w /etc/localtime -p wa -k time-change',
    order   => 5,
  }
  auditd::rule { '(4.1.5) - Ensure events that modify user/group information are collected (Scored), group':
    content => '-w /etc/group -p wa -k identity',
    order   => 6,
  }
  auditd::rule { '(4.1.5) - Ensure events that modify user/group information are collected (Scored),passwd':
    content => '-w /etc/passwd -p wa -k identity',
    order   => 7,
  }
  auditd::rule { '(4.1.5) - Ensure events that modify user/group information are collected (Scored), gshadow':
    content => '-w /etc/gshadow -p wa -k identity',
    order   => 8,
  }
  auditd::rule { '(4.1.5) - Ensure events that modify user/group information are collected (Scored), shadow':
    content => '-w /etc/shadow -p wa -k identity',
    order   => 9,
  }
  auditd::rule { '(4.1.5) - Ensure events that modify user/group information are collected (Scored),opasswd file':
    content => '-w /etc/security/opasswd -p wa -k identity',
    order   => 10,
  }
  auditd::rule { '(4.1.6) - Ensure events that modify the systems network environment are collected (Scored), 64bit':
    content => '-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale',
    order   => 11,
  }
  auditd::rule { '(4.1.6) - Ensure events that modify the systems network environment are collected (Scored), 32bit':
    content => '-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale',
    order   => 12,
  }
  auditd::rule { '(4.1.6) - Ensure events that modify the systems network environment are collected (Scored), issue file':
    content => '-w /etc/issue -p wa -k system-locale',
    order   => 13,
  }
  auditd::rule { '(4.1.6) - Ensure events that modify the systems network environment are collected (Scored), issue.net file':
    content => '-w /etc/issue.net -p wa -k system-locale',
    order   => 14,
  }

  auditd::rule { '(4.1.6) - Ensure events that modify the systems network environment are collected (Scored), hosts file':
    content => '-w /etc/hosts -p wa -k system-locale',
    order   => 15,
  }
  auditd::rule { '(4.1.6) - Ensure events that modify the systems network environment are collected (Scored), network file':
    content => '-w /etc/sysconfig/network -p wa -k system-locale',
    order   => 16,
  }
  auditd::rule { '(4.1.7) - Ensure events that modify the systems Mandatory Access Controls are collected (Scored)':
    content => '-w /etc/selinux/ -p wa -k MAC-policy',
    order   => 17,
  }
  auditd::rule { '(4.1.8) - Ensure login and logout events are collected (Scored), lastlog':
    content => '-w /var/log/lastlog -p wa -k logins',
    order   => 18,
  }
  auditd::rule { '(4.1.8) - Ensure login and logout events are collected (Scored), faillock':
    content => '-w /var/run/faillock/ -p wa -k logins',
    order   => 19,
  }
  auditd::rule {'(4.1.9) Ensure session initiation information is collected (Scored), utmp':
    content => '-w /var/run/utmp -p wa -k session',
    order   => 20,
  }
  auditd::rule {'(4.1.9) Ensure session initiation information is collected (Scored), wtmp':
    content => '-w /var/run/wtmp -p wa -k session',
    order   => 21,
  }
  auditd::rule {'(4.1.9) Ensure session initiation information is collected (Scored), btmp':
    content => '-w /var/run/btmp -p wa -k session',
    order   => 23,
  }
  auditd::rule {'(4.1.10) - Ensure discretionary access control permission modification events are collected (Scored), 64bt chmod':
    content => '-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    order   => 24,
  }
  auditd::rule {'(4.1.10) - Ensure discretionary access control permission modification events are collected (Scored), 32bt chmod':
  content => '-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod',
  order   => 25,
  }
  auditd::rule {'(4.1.10) - Ensure discretionary access control permission modification events are collected (Scored), 64bt chown':
    content => '-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    order   => 26,
  }
  auditd::rule {'(4.1.10) - Ensure discretionary access control permission modification events are collected (Scored), 32bt chown':
  content => '-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod',
  order   => 27,
  }
  auditd::rule {'(4.1.10) - Ensure discretionary access control permission modification events are collected (Scored), 64bt att':
    content => '-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 -k perm_mod',
    order   => 28,
  }
  auditd::rule {'(4.1.10) - Ensure discretionary access control permission modification events are collected (Scored), 32bt att':
  content => '-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295
-k perm_mod',
  order   => 29,
  }
  auditd::rule { '(4.1.11) Ensure unsuccessful unauthorized file access attempts are collected (Scored), 64bit EACCES':
    content => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access',
    order   => 30,
  }
  auditd::rule { '(4.1.11) Ensure unsuccessful unauthorized file access attempts are collected (Scored), 32bit EACCES':
    content => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access',
    order   => 31,
  }
  auditd::rule { '(4.1.11) Ensure unsuccessful unauthorized file access attempts are collected (Scored), 64bit EPERM':
    content => '-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access',
    order   => 32,
  }
  auditd::rule { '(4.1.11) Ensure unsuccessful unauthorized file access attempts are collected (Scored), 32bit EPERM':
    content => '-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access',
    order   => 33,
  }


} #EOF
