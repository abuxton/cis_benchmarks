class cis_benchmarks::redhat7::rule::v_1_0_0::rule_4_0 {

  # includes Rules:
  # 4.0 - Protects against SYN floods by establishing a ceiling on the number of open TCP connections

  # Use fiddyspence-sysctl module to handle all sysctl settings
  sysctl { 'net.ipv4.tcp_max_syn_backlog':
    ensure    => present,
    permanent => yes,
    value     => '1024',
  }

} #EOF
