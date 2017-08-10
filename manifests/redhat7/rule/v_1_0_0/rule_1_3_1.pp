class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_3_1 {

  # includes Rules:
  # 1.3.1 - Install AIDE (Scored)

  package { '(1.3.1) - AIDE is installed':
      ensure => present,
      name   => 'aide',
  }

  exec { '(1.3.1) - Initialize AIDE':
    path    => [ '/usr/bin', '/usr/sbin', '/bin' ],
    command => "aide --init -B 'database_out=file:/var/lib/aide/aide.db.gz'",
    creates => '/var/lib/aide/aide.db.gz',
  }


} #EOF
