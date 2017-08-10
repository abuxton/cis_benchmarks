class mtn_cis::redhat7::rule::v_1_0_0::rule_4_5_1 {

  # includes Rules:
  # 4.5.1 - Install TCP Wrappers (Not Scored)

  package { '(4.5.1) - Install TCP Wrappers':
    ensure => present,
    name   => 'tcp_wrappers',
  }

} #EOF
