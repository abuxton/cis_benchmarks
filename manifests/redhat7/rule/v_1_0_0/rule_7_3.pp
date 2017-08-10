class cis_benchmarks::redhat7::rule::v_1_0_0::rule_7_3 {
  #includes Rules:
  # 6.5.2 - Verify that wheel is a group of root user (Scored)
  # 7.3   - Set Default Group for root Account (Scored)

  user { "(7.3) - Set default group for 'root' account":
    ensure => present,
    name   => 'root',
    gid    => '0',
    uid    => '0',
    groups => [ 'root', 'wheel' ],
  }


} #EOF
