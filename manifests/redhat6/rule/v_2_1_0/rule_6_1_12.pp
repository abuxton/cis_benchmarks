# 6.1 System File Permissions
# 6.1.12 Ensure no ungrouped files or directories exist (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_1_12 {

  $files = $::cis_benchmarks['ungrouped_files']

  if $files != ''
  {
      notify { '(6.1.12) - Ensure no ungrouped files or directories exist (Scored), FAILED': }
  }


} #EOF
