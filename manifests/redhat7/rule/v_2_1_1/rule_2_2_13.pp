# 2.2.13 Ensure HTTP proxy is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_13 {
  service{ '(2.2.14) - Disable HTTP Proxy Squid (Scored)':
    name   => 'squid',
    enable => false,
  }
} #EOF
