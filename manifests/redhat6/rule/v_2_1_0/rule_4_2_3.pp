# 4.2.3 Ensure rsyslog or syslog-ng is installed (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_4_2_3{
  if (defined(Package['rsyslog']) or defined(Package['syslog-ng'])) or (!defined(Package['rsyslog']) and !defined(Package['syslog-ng'])) {
    notify{ '(4.2.3) - Ensure rsyslog or syslog-ng is installed (Scored)':
    }
  }

} #EOF
