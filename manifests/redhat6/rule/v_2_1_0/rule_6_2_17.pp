# 6.2.17 Ensure no duplicate GIDs exist (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_17 {


  $gid = $::cis_benchmarks['dup_gid']

  if $gid != ''
  {
      notify { '(6.2.17) - Ensure no duplicate GIDs exist (Scored): FAILED': }
  }

} #EOF
