# 3.2 Network Parameters (Host and Router)
# 3.2.1 Ensure source routed packets are not accepted (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_3_2_1 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { '(3.2.1) - Ensure all source routed packets are not accepted (Scored)':
    name      => 'net.ipv4.conf.all.accept_source_route',
    permanent => 'yes',
    value     => '0',
  }
  file_line { '(3.2.1) - Ensure all source routed packets are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.accept_source_route = 0',
    match  => '^net.ipv4.conf.all.accept_source_route',
    }
    sysctl { '(3.2.1) - Ensure default source routed packets are not accepted (Scored)':
      name      => 'net.ipv4.conf.default.accept_source_route',
      permanent => 'yes',
      value     => '0',
    }
    file_line { '(3.2.1) - Ensure default source routed packets are not accepted (Scored)':
      ensure => present,
      path   => $file,
      line   => 'net.ipv4.conf.default.accept_source_route = 0',
      match  => '^net.ipv4.conf.default.accept_source_route',
      }


} #EOF
