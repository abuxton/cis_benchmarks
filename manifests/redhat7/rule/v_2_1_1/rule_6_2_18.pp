# 6.2.18 Ensure no duplicate user names exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_18 {

  $dups = $::cis_benchmarks['dup_name']

  if $dups != undef and $dups != ''
  {
      notify { '(6.2.18) - Ensure no duplicate user names exist (Scored): FAILED': }
  }


} #EOF
