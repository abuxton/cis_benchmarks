class mtn_cis::redhat7::rule::v_1_0_0::rule_9_2_1 {
  # includes Rules:
  # 9.2.1 - Ensure Password Fields are Not Empty (Scored)

  $pw = $::cis_benchmarks['password_fields']

  if $pw != ''
  {
      notify { "(9.2.1) - Passwords for these users are empty: ${pw}": }
  }


} #EOF
