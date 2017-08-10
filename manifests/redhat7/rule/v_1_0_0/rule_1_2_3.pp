class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_2_3 {
  # includes Rules:
  # 1.2.3 - Verify that gpgcheck is Globally Activated (Scored)

  file { '/etc/yum.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file_line { '(1.2.3) /etc/yum.conf contains gpgcheck=1':
    ensure => present,
    path   => '/etc/yum.conf',
    line   => 'gpgcheck=1',
  }

} #EOF
