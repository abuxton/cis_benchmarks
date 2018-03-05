# 2.2.4 Ensure Cups is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_4 {
  service{ '(2.2.4) - Disable Cups (Scored)':
    name   => 'cups',
    enable => false,
  }

} #EOF
