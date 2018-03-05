# 2.2.16 Ensure NIS Server is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_16 {
  service{ '(2.2.16) - Disable NIS Server(Scored)':
    name   => 'ypserv',
    enable => false,
  }
} #EOF
