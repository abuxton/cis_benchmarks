class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_1_1 {

  # includes Rules:
  # 1.1.1 - Create Separate Partition for /tmp (Scored)
  # 1.1.2 - Set nodev option for /tmp Partition (Scored)
  # 1.1.3 - Set nosuid option for /tmp Partition (Scored)
  # 1.1.4 - Set noexec option for /tmp Partition (Scored)

  file { '(1.1.1) "/tmp" properties':
    ensure => 'directory',
    path   => '/tmp',
    mode   => '1777',
    owner  => 'root',
    group  => 'root',
  }

  mount { '(1.1.1 - 1.1.4) /tmp is mounted':
    ensure  => 'mounted',
    name    => '/tmp',
    device  => '/tmp',
    fstype  => 'tmpfs',
    options => 'nodev,nosuid,noexec'
  }

} #EOF
