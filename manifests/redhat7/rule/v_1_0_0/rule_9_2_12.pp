class mtn_cis::redhat7::rule::v_1_0_0::rule_9_2_12 {
  # includes Rules:
  # 9.2.12 - Check That Users Are Assigned Valid Home Directories (Scored)

  $valid = $::cis_benchmarks['validhome']

  if $valid != ''
  {
      notify { "(9.2.12) - Home directory of user does not exist: ${valid}": }
  }

} #EOF
