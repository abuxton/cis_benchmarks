# 2.2.8 Ensure DNS Server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_8 {
  exec{ '2.2.8 - Disable DNS Server (Scored)':
    command => 'systemctl disable named',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled named) == "enabled"]',
  }


} #EOF
