class mtn_cis::redhat7::rule::v_1_0_0::rule_9_1_13 {
  # includes Rules:
  # 9.1.13 - Find SUID System Executables (Not Scored)

  $files = $::cis_benchmarks['suid_exec']

  if $files != ''
  {
      notify { "(9.1.13) - SUID system executables exist: ${files}": }
  }
} #EOF
