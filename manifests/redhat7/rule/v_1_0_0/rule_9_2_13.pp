class cis_benchmarks::redhat7::rule::v_1_0_0::rule_9_2_13 {
  # includes Rules:
  # 9.2.13 - Check User Home Directory Ownership (Scored)

  $home = $::cis_benchmarks['userhome']

  if $home != ''
  {
      notify { "(9.2.13) - Home directory of user is actually owned by: [Dir:Owner]: ${home}": }
  }

} #EOF
