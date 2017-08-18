# 6.2.5 Ensure root is the only UID 0 account (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_5 {
  $uid = $::cis_benchmarks['uid']

  if $uid != ''
  {
      notify { '(6.2.5) Ensure root is the only UID 0 account (Scored): FAIILED': }
  }
} #EOF
