# 2.2.17 Ensure rsh server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_17 {
  service{ '(2.2.17) - Disable rsh.socket(Scored)':
    name    => 'rsh',
    enable => false,
  }
  service{ '(2.2.17) - Disable exec.socket(Scored)':
    name    => 'rlogin.socket',
    enable => false,
  }
  service{ '(2.2.17) - Disable rlogin.socket(Scored)':
    name    => 'rexec.socket',
    enable => false,
  }
} #EOF
