# 6.1 System File Permissions
# 6.1.11 Ensure no unowned files or directories exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_11 {

  $files = $::cis_benchmarks['unowned_files']

  if $files != ''
  {
      notify { "(6.1.11) Ensure no unowned files or directories exist (Scored), FAILED ${files}": }
  }

} #EOF
