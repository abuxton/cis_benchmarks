# 2.2.5 Ensure DHCP Server is not enabled is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_5 {
  service{ '(2.2.5) - Disable DHCPD (Scored)':
    name   => 'dhcp',
    enable => false,
    }

} #EOF
