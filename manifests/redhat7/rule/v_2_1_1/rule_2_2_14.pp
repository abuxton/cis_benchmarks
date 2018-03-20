# 2.2.14 Ensure SNMP Server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_14 {
  service{ '(2.2.14) - Disable snmpd (Scored)':
    name   => 'snmpd',
    enable => false,
  }
} #EOF
