# 2.2.20 Ensure tftp server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_20 {
  service{ '(2.2.20) - Ensure tftp server is not enabled (Scored)':
    name    => 'tftp.socket',
    enable => false,
  }
} #EOF
