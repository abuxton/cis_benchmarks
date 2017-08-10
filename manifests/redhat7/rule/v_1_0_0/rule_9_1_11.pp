class mtn_cis::redhat7::rule::v_1_0_0::rule_9_1_11 {
  # includes Rules:
  # 9.1.11 - Find Un-owned Files and Directories (Scored)

  $files = $::cis_benchmarks['unowned_files']

  if $files != ''
  {
      notify { "(9.1.11) - Unowned files and directories exist: ${files}": }
  }


} #EOF
