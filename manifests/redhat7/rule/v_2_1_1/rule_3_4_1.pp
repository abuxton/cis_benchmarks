# 3.4 TCP Wrappers
# 3.4.1 Ensure TCP Wrappers is installed (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_4_1 {
  package { '(3.4.1) - Ensure TCP Wrappers is installed (Scored)':
    ensure =>  installed,
    name   =>  'tcp_wrappers',
    }

} #EOF
