# 6.2.16 Ensure no duplicate UIDs exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_16 {

  $uid = $::cis_benchmarks['dup_uid']

  if $uid != undef and  $uid != ''
  {
      notify { '(6.2.16) - Ensure no duplicate UIDs exist (Scored): FAILED': }
  }

}#EOF
