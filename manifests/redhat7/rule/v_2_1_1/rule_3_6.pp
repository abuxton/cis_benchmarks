# 3.6 Firewall Configuration
# this module does not manage the firewall,
# if invoked it does ensure the specified package is installed.
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_6 {

  package {'(3.6.1) - Ensure iptables is installed (Scored)':
      ensure => 'installed',
      name   => 'iptables',
    }

  notice ('(3.6.2) Ensure default deny firewall policy (Scored)')
  notice ('(3.6.3) Ensure loopback traffic is configured (Scored)')
  notice ('(3.6.4) Ensure outbound and established connections are configured (Not Scored)')
  notice('(3.6.5) Ensure firewall rules exist for all open ports (Scored)')
  notice("${module_name} and ${caller_module_name} are not responsible for 3.6.2 - 3.6.5 please configure your firewall")
} #EOF
