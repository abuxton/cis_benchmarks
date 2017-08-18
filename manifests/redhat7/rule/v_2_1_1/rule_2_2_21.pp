# 2.2.21 Ensure rsync service is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_21 {
  service{ '(2.2.21) - rsync service is not enabled (Scored)':
    name   => 'rsyncd',
    enable => false,
  }
} #EOF
