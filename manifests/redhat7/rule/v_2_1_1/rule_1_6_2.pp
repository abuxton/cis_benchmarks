1.6.2 Ensure SELinux is installed (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_5_4 {
  package{ '1.6.2 Ensure libselinux is installed (Scored)':
    name    => 'libselinux',
    ensure  => installed,
  }
} #EOF
