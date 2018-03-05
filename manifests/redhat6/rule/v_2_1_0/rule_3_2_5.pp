# 3.2 Network Parameters (Host and Router)
# 3.2.5 Ensure broadcast ICMP requests are ignored (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_3_2_5 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { '(3.2.5) - Ensure all broadcast ICMP requests are ignored (Scored)':
    name      => 'net.ipv4.icmp_echo_ignore_broadcasts',
    permanent => 'yes',
    value     => '1',
  }
  file_line { '(3.2.5) - Ensure all broadcast ICMP requests are ignored (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.icmp_echo_ignore_broadcasts = 1',
    match  => '^net.ipv4.icmp_echo_ignore_broadcasts',
    }



} #EOF
