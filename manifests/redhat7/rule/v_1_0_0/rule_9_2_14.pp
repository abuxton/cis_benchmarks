class cis_benchmarks::redhat7::rule::v_1_0_0::rule_9_2_14 {
  # includes Rules:
  # 9.2.14 - Check for Duplicate UIDs (Scored)

  $uid = $::cis_benchmarks['dup_uid']

  if $uid != ''
  {
      notify { "(9.2.14) - Duplicate UIDs found: ${uid}": }
  }

} #EOF
