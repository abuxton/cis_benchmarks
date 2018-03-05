# 2.2.18 Ensure talk server is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_18 {
  service{ '(2.2.18) - Disable talk Server(Scored)':
    name   => 'ntalk',
    enable => false,
  }
} #EOF
