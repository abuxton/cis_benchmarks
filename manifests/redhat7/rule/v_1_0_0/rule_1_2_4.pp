class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_2_4 {

  # includes Rules:
  # 1.2.4 - Disable the rhnsd Daemon (Not Scored)

  if $::operatingsystem == 'RedHat' {
    service { '(1.2.4) rhnsd service is disabled':
      ensure => stopped,
      name   => 'rhnsd',
      enable => false,
    }
  } else {
      notify { '(1.2.4) - This operating system is not RedHat, skipping rule..': }
  }

} #EOF
