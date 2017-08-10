class cis_benchmarks::redhat7::rule::v_1_0_0::rule_9_1_2  {

  # includes Rules:
  # 9.1.2 - Verify Permissions on /etc/passwd (Scored)
  # 9.1.3 - Verify Permissions on /etc/shadow (Scored)
  # 9.1.4 - Verify Permissions on /etc/gshadow (Scored)
  # 9.1.5 - Verify Permissions on /etc/group (Scored)
  # 9.1.6 - Verify User/Group Ownership on /etc/passwd (Scored)
  # 9.1.7 - Verify User/Group Ownership on /etc/shadow (Scored)
  # 9.1  .8 - Verify User/Group Ownership on /etc/gshadow (Scored)
  # 9.1.9 - Verify User/Group Ownership on /etc/group (Scored)

  file { '(9.1.2, 9.1.6) - /etc/passwd: ownership & permissions':
    ensure => file,
    path   => '/etc/passwd',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '(9.1.3, 9.1.7) - /etc/shadow: ownership & permissions':
    ensure => file,
    path   => '/etc/shadow',
    owner  => 'root',
    group  => 'root',
    mode   => '0000',
  }

  file { '(9.1.4, 9.1  .8) - /etc/gshadow: ownership & permissions':
    ensure => file,
    path   => '/etc/gshadow',
    owner  => 'root',
    group  => 'root',
    mode   => '0000',
  }

  file { '(9.1.5, 9.1.9) - /etc/group: ownership & permissions':
    ensure => file,
    path   => '/etc/group',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

} #EOF

