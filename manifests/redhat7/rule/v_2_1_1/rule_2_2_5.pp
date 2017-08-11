# 2.2.5 Ensure DHCP Server is not enabled is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_5 (
  exec{ '2.2.3 - Disable Cups (Scored)':
    command => 'systemctl disable dhcpd',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled dhcpd) == "enabled"]',
  }

} #EOF
