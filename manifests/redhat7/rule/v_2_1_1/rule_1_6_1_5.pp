# 1.6.1.5 Ensure the MCS Translation Service (mcstrans) is not installed (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_6_1_5{

  package{ '1.6.1.5 Ensure mcstrans is removed (Scored)':
    ensure => purged,
    name   => 'mcstrans',
  }
} #EOF
