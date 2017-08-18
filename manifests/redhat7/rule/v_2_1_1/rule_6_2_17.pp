# 6.2.17 Ensure no duplicate GIDs exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_17 {


  $gid = $::cis_benchmarks['dup_gid']

  if $gid != ''
  {
      notify { '(6.2.17) - Ensure no duplicate GIDs exist (Scored): FAILED': }
  }

} #EOF
