class mtn_cis::redhat7::rule::v_1_0_0::rule_9_2_15 {
  # includes Rules:
  # 9.2.15 - Check for Duplicate GIDs (Scored)

  $gid = $::cis_benchmarks['dup_gid']

  if $gid != ''
  {
      notify { "(9.2.15) - Duplicate GIDs found: ${gid}": }
  }

} #EOF
