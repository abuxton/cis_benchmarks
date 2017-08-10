class cis_benchmarks::redhat7::rule::v_1_0_0::rule_9_1_10 {
  # includes Rules:
  # 9.1.10 - Find World Writable Files (Not Scored)

  $files = $::cis_benchmarks['system_acct']

  if $files != ''
  {
      notify { "(9.1.10) - World writeable files exist: ${files}": }
  }


} #EOF
