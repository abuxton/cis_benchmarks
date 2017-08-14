# 4.1.13 Ensure successful file system mounts are collected (Scored)
# 4.1.14 Ensure file deletion events by users are collected (Scored)
# 4.1.15 Ensure changes to system administration scope (sudoers) is collected (Scored)
# 4.1.16 Ensure system administrator actions (sudolog) are collected (Scored)
# 4.1.17 Ensure kernel module loading and unloading is collected (Scored)
# 4.1.18 Ensure the audit configuration is immutable (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_1_13 {
  include ::cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_1
  auditd::rule { '(4.1.13) - Ensure successful file system mounts are collected (Scored), 64bit':
    content => '-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
    order   => 40,
  }
  auditd::rule { '(4.1.13) - Ensure successful file system mounts are collected (Scored), 32 bit':
    content => '-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts',
    order   => 41,
  }
  auditd::rule { '(4.1.14) Ensure file deletion events by users are collected (Scored), 64bit':
    content => '-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
    order   => 42,
  }
  auditd::rule { '(4.1.14) - Ensure successful file system mounts are collected (Scored), 32 bit':
    content => '-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete',
    order   => 43,
  }
  auditd::rule{'(4.1.15) - Ensure changes to system administration scope (sudoers) is collected (Scored), sudoers':
    content => '-w /etc/sudoers -p wa -k scope',
    order   => 44,
  }
  auditd::rule{'(4.1.15) - Ensure changes to system administration scope (sudoers) is collected (Scored), sudoers.d':
    content => '-w /etc/sudoers.d -p wa -k scope',
    order   => 45,
  }
  auditd::rule{ '(4.1.16) - Ensure system administrator actions (sudolog) are collected (Scored)':
    content => '-w /var/log/sudo.log -p wa -k actions',
    order   => 46,
  }
  auditd::rule{ '(4.1.17) - Ensure kernel module loading and unloading is collected (Scored), insmod':
    content => '-w /sbin/insmod -p x -k modules',
    order   => 47,
  }
  auditd::rule{ '(4.1.17) - Ensure kernel module loading and unloading is collected (Scored), rmmod':
    content => '-w /sbin/rmmod -p x -k modules',
    order   => 48,
  }
  auditd::rule{ '(4.1.17) - Ensure kernel module loading and unloading is collected (Scored), modprobe':
    content => '-w /sbin/modprobe -p x -k modules',
    order   => 49,
  }
  auditd::rule{ '(4.1.17) - Ensure kernel module loading and unloading is collected (Scored), modules':
    content => '-a always,exit arch=b64 -S init_module -S delete_module -k modules',
    order   => 50,
  }
  auditd::rule{ '(4.1.18) - Ensure the audit configuration is immutable (Scored)':
    content => '-e 2',
    order   => 199,
  }

} #EOF
