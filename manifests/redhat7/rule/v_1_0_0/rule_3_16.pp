class cis_benchmarks::redhat7::rule::v_1_0_0::rule_3_16 {
  # includes Rules:
  # 3.16 - Configure Mail Transfer Agent for Local-Only Mode (Scored)

  package { '(3.16) - Postfix installed':
    ensure => installed,
    name   => 'postfix',
  }

  file { '(3.16) - /etc/postfix/main.cf exists':
    ensure  => file,
    name    => '/etc/postfix/main.cf',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => Package['(3.16) - Postfix installed'],
  }

  service { '(3.16) - Postfix service running':
    ensure    => running,
    name      => 'postfix',
    subscribe => File['(3.16) - /etc/postfix/main.cf exists'],
  }

  file_line { '(3.16) - inet_interfaces = localhost':
    ensure => present,
    path   => '/etc/postfix/main.cf',
    line   => 'inet_interfaces = localhost',
    match  => '^inet_interfaces',
  }

} #EOF
