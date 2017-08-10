class mtn_cis::redhat7::rule::v_1_0_0::rule_1_4_4 {

  # includes Rules:
  # 1.4.4 - Remove SETroubleshoot (Scored)
  # 1.4.5 - Remove MCS Translation Service (mcstrans) (Scored)

  package { '(1.4.4) - remove SETroubleshoot':
    ensure => absent,
    name   => 'setroubleshoot',
  }

  package { '(1.4.5) - remove MCS Translation Service':
    ensure => absent,
    name   => 'mcstrans',
  }

} #EOF
