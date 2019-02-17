# 6.1 System File Permissions
# 6.1.10 Ensure no world writable files exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_10 {
  $ww_files = $::cis_benchmarks['ww_files']

  if ($ww_files != undef and $ww_files != '' ) {
      notify { '(6.1.10) Ensure no world writable files exist (Scored), FAILED': }
  }

} #EOF
