# 2.2.13 Ensure HTTP proxy is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_13 {
  exec{ '2.2.12 - Disable HTTP Proxy Squid (Scored)':
    command => 'systemctl disable squid',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled squid) == "enabled"]',
  }
} #EOF
