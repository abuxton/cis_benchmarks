# 2.2.15 Ensure mail transfer agent is configured for local-only mode (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_15 {
  file_line { '(2.2.15) - Postfix reconfigured (Scored)':
    ensure => present,
    path   => '/etc/postfix/main.cf',
    line   => 'inet_interfaces = localhost',
    notify => Service['(2.2.15) - Postfix reconfigured (Scored)'],
    }
  service{ '(2.2.15) - Postfix reconfigured (Scored)':
    ensure  => running,
    name    => 'postfix',
    enable => true,
  }
} #EOF
