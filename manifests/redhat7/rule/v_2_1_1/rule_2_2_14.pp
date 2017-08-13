# Ensure SNMP Server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_14 {
  exec{ '2.2.14 - Disable snmpd (Scored)':
    command => 'systemctl disable snpd',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled snmpd) == "enabled"]',
  }
} #EOF
