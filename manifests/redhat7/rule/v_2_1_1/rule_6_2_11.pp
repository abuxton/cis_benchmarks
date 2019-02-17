# 6.2.11 Ensure no users have .forward files (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_11 {

  $forward = $::cis_benchmarks['forward']

  if $forward != undef and $forward != ''
  {
      notify { '(6.2.11) - Ensure no users have .forward files (Scored): FAILED': }
  }


} #EOF
