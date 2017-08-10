class cis_benchmarks::redhat7::rule::v_1_0_0::rule_9_1_14 {
  # includes Rules:
  # 9.1.14 - Find SGID System Executables (Not Scored)

  $files = $::cis_benchmarks['sgid_exec']

  if $files != ''
  {
      notify { "(9.1.14) - SGID system executables exist: ${files}": }
  }
} #EOF
