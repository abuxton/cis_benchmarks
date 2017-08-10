class cis_benchmarks::redhat7::rule::v_1_0_0::rule_3_3 {
  # includes Rules:
  # 3.3 - Disable Avahi Server (Scored)
  # 3.4 - Disable Print Server - CUPS (Not Scored)
  # 3.5 - Remove DHCP Server (Scored)

  service { '(3.3) - disable Avahi server':
    ensure => stopped,
    name   => 'avahi-daemon',
    enable => false,
  }

  service { '(3.4) - disable Print server CUPS':
    ensure => stopped,
    name   => 'cups',
    enable => false,
  }

  package { '(3.5) - remove DHCP server':
    ensure => absent,
    name   => 'dhcp',
  }

} #EOF
