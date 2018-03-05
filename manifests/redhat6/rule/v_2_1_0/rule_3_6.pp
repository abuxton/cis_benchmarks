# 3.6 Firewall Configuration
# this module does not manage the firewall,
# if invoked it does ensure the specified package is installed.
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_3_6 {

  package {'(3.6.1) - Ensure iptables is installed (Scored)':
      ensure => 'installed',
      name   => 'iptables',
    }
    -> notify { '(3.6.2) Ensure default deny firewall policy (Scored)':
    }
    -> notify{'(3.6.3) Ensure loopback traffic is configured (Scored)':
    }
    -> notify{'(3.6.4) Ensure outbound and established connections are configured (Not Scored)':
    }
    -> notify{'(3.6.5) Ensure firewall rules exist for all open ports (Scored)':
    }
    -> notify { "${module_name} and ${caller_module_name} are not responsible for 3.6.2 - 3.6.5 please configure your firewall":}
} #EOF
