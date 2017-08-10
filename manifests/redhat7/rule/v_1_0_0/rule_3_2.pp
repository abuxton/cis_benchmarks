class mtn_cis::redhat7::rule::v_1_0_0::rule_3_2 {
  # includes Rules:
  # 3.2 - Remove the X Window System (Scored)

  package { '(3.2) - remove X Window system':
    ensure => absent,
    name   => 'xorg-x11-server-common',
  }

  file { '(3.2) - default.target':
    ensure => link,
    name   => '/usr/lib/systemd/system/default.target',
    target => 'multi-user.target',
  }

} #EOF
