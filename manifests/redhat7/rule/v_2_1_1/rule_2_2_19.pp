# 2.2.19 Ensure telnet server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_19 {
  service{ '(2.2.19) - Disable telnet Server(Scored)':
    name    => 'telnet.socket',
    enable => false,
  }
} #EOF
