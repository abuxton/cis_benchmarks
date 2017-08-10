class cis_benchmarks::redhat7::rule::v_1_0_0::rule_7_2 {
  #includes Rules:
  # 7.2 - Set Password Expiration Days (Scored)

  $system_acct = $::cis_benchmarks['system_acct']

  if ($system_acct != '') {
      notify { "(7.2) - System accounts not disabled: ${system_acct}": }
  }


} #EOF
