# 3.2 Network Parameters (Host and Router)
# 3.2.6 Ensure bogus ICMP responses are ignored (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_2_6 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { '(3.2.6) - Ensure all bogus ICMP responses are ignored (Scored)':
    name      => 'net.ipv4.icmp_ignore_bogus_error_responses',
    permanent => 'yes',
    value     => '1',
  }
  file_line { '(3.2.6) - Ensure all bogus ICMP responses are ignored (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.icmp_ignore_bogus_error_responses = 1',
    match  => '^net.ipv4.icmp_ignore_bogus_error_responses',
    }



} #EOF
