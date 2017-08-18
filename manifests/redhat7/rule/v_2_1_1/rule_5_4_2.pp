# 5.4 User Accounts and Environment
# 5.4.2 Set Shadow Password Suite Parameters

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_4_2 {
  $system_acct = $::cis_benchmarks['system_acct']

  if ($system_acct != '') {
      notify { '(5.4.2) - Ensure system accounts are non-login (Scored), needs attention': }
  }
} #EOF
