# 4.3 Ensure logrotate is configured (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_3 {
  if !defined(Package['rsyslog']) and !defined(Package['syslog-ng']) {
    notify{ '# (4.3) - Ensure logrotate is configured (Not Scored)':
    }
  }

} #EOF
