# 4.3 Ensure logrotate is configured (Not Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_4_3 {
  if !defined(Package['rsyslog']) and !defined(Package['syslog-ng']) {
    notify{ '# (4.3) - Ensure logrotate is configured (Not Scored)':
    }
  }

} #EOF
