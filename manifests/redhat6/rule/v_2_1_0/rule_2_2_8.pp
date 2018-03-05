# 2.2.8 Ensure DNS Server is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_8 {
  service{ '(2.2.8) - Disable DNS Server (Scored)':
    name   =>  'named',
    enable =>  false,
  }


} #EOF
