# 2.2.3 Ensure Avahi Server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_3 {
  service {'(2.2.3) - Disable Avahi (Scored)':
    name   => 'avahi-daemon',
    enable => false,
  }

} #EOF
