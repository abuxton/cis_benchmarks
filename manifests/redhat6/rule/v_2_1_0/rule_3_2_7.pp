# 3.2 Network Parameters (Host and Router)
# 3.2.7 Ensure Reverse Path Filtering is enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_3_2_7 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { '(3.2.7) - Ensure all Reverse Path Filtering is enabled (Scored)':
    name      => 'net.ipv4.conf.all.rp_filter',
    permanent => 'yes',
    value     => '1',
  }
  file_line { '(3.2.7) - Ensure all Reverse Path Filtering is enabled (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.rp_filter = 1',
    match  => '^net.ipv4.conf.all.rp_filter',
    }
    sysctl { '(3.2.7) - Ensure default Reverse Path Filtering is enabled (Scored)':
      name      => 'net.ipv4.conf.default.rp_filter',
      permanent => 'yes',
      value     => '1',
    }
    file_line { '(3.2.7) - Ensure default Reverse Path Filtering is enabled (Scored)':
      ensure => present,
      path   => $file,
      line   => 'net.ipv4.conf.default.rp_filter = 1',
      match  => '^net.ipv4.conf.default.rp_filter',
      }


} #EOF
