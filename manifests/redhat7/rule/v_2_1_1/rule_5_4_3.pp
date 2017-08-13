# 5.4 User Accounts and Environment
# 5.4.3 Ensure default group for the root account is GID 0 (Scored)

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_4_3 {
  user{'(5.4.3) - Ensure default group for the root account is GID 0 (Scored)':
    ensure => present,
    name   => 'root',
    gid    => 0,
  }
} #EOF
