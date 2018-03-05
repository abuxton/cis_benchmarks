#1.6.2 Ensure SELinux is installed (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_6_2 {
  package{ '1.6.2 Ensure libselinux is installed (Scored)':
    ensure => installed,
    name   => 'libselinux',
  }
} #EOF
