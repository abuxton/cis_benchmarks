# 6.2.6 Ensure root PATH Integrity (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_6 {
  $paths = $::cis_benchmarks['verify_root']

  if $paths != ''
  {
      notify { '(6.2.6) - Ensure root PATH Integrity (Scored): FAILED': }
  }
} #EOF
