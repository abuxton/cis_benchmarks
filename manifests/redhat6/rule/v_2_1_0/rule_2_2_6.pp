# 2.2.5 Ensure LDAP Server is not enabled is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_6 {
  service{ '(2.2.6) - Disable LDAP Server (Scored)':
    name   => 'slapd',
    enable => false,
    }

} #EOF
