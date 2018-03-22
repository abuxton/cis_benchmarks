# 6.2.16 Ensure no duplicate UIDs exist (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_16 {

  $uid = $::cis_benchmarks['dup_uid']

  if $uid != ''
  {
      notify { '(6.2.16) - Ensure no duplicate UIDs exist (Scored): FAILED': }
  }

}#EOF
