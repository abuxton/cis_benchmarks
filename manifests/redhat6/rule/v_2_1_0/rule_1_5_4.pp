# 1.5.4 Ensure prelink is disabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_5_4 {
  package{ '1.5.4 Ensure prelink is disabled (Scored)':
    ensure => purged,
    name   => 'prelink',
  }
} #EOF
