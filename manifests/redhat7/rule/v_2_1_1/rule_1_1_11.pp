# 1.1.11 Ensure separate partition exists for /var/log (Scored)
# 1.1.12 Ensure separate partition exists for /var/log/audit (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_11{
file_line { '(1.1.11) /var/log is separate mount':
  path    => '/etc/fstab',
  line    => '#<volume>  /var/log  <fstype> nodev 0 0',
  match   => '\*/var/log\*nodev',
  replace => false,
  }
file_line { '(1.1.12) /var/log/audit is separate mount':
  path    => '/etc/fstab',
  line    => '#<volume>  /var/log/audit  <fstype> nodev 0 0',
  match   => '\*/var/log/audit',
  replace => false,
  }

}#eof
