class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_2_5 {
  # includes Rules:
  # 1.2.5 - Obtain Software Package Updates with yum (Not Scored)

  $updates = $::cis_benchmarks['yum_updates']
  if $updates == 'yum updates are available'
  {
    notify { '(1.2.5) - Yum updates are available for this host': }
  }

} #EOF
