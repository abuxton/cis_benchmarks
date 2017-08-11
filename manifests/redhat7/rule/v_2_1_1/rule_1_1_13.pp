# 1.1.13 Ensure separate partition exists for /home (Scored)
# 1.1.14 Ensure nodev option set on /home partition (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_13{
  file_line { '(1.1.13 - 1.1.14) /home is separate mount':
    path  => '/etc/fstab',
    line  => '#<volume> /home <fstype>  nodev 0 0',
    #match => '\*/home\*nodev',
  }

}#eof
