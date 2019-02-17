# 6.1 System File Permissions
# 6.1.12 Ensure no ungrouped files or directories exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_12 {

  $files = $::cis_benchmarks['ungrouped_files']

  if $files != undef and $files != ''
  {
      notify { '(6.1.12) - Ensure no ungrouped files or directories exist (Scored), FAILED': }
  }


} #EOF
