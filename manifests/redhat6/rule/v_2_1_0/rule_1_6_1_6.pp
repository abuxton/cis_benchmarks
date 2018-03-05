# 1.6.1.6 Ensure no unconfined daemons exist (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_6_1_6{

  $ud = $::cis_benchmarks['unconfined_daemons']

  if $ud != ''
  {
    notify { '(1.6_1_6) - Unconfined daemons present: FAILED': }
  }
} #EOF
