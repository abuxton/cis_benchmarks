class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_1_7 {

  # includes Rules:
  # 1.1.7, 1.1.8, 1.1.9, 1.1.10

  file_line { '(1.1.7) /var/log is separate mount':
    path => '/etc/fstab',
    line => '#<volume>  /var/log  <fstype> nodev 0 0',
    #match => '\*/var/log\*nodev',
  }

  file_line { '(1.1.8) /var/log/audit is separate mount':
    path => '/etc/fstab',
    line => '#<volume>  /var/log/audit  <fstype> nodev 0 0',
    #match => '\*/var/log/audit',
  }

  file_line { '(1.1.9 - 1.1.10) /home is separate mount':
    path => '/etc/fstab',
    line => '#<volume> /home <fstype>  nodev 0 0',
    #match => '\*/home\*nodev',
  }


} #EOF
