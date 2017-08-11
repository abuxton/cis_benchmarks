# 2.2.3 Ensure Avahi Server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_3 {
  exec{ '2.2.3 - Disable Avahi (Scored)':
    command => 'systemctl disable avahi-damon',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled avahi-daemon) == "enabled"]',
  }

} #EOF
