class cis_benchmarks::redhat7::rule::v_1_0_0::rule_7_5 {
  #includes Rules:
  # 7.5 - Lock Inactive User Accounts (Scored)

  $inactive_acct = $::cis_benchmarks['inactive_acct']

  if ($inactive_acct != '35') {
      notify { "(7.5) - Inactive Accounts set to disable after 35 days: ${inactive_acct}": }
  }


} #EOF
