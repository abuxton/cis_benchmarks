# 3.2 Network Parameters (Host and Router)
# 3.2.3 Ensure secure ICMP redirects are not accepted (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_2_3 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { '(3.2.3) - Ensure all secure ICMP redirects are not accepted (Scored)':
    name      => 'net.ipv4.conf.all.secure_redirects',
    permanent => 'yes',
    value     => '0',
  }
  file_line { '(3.2.3) - Ensure all secure ICMP redirects are not accepted (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.secure_redirects = 0',
    match  => '^net.ipv4.conf.all.secure_redirects',
    }
    sysctl { '(3.2.3) - Ensure default secure ICMP redirects are not accepted (Scored)':
      name      => 'net.ipv4.conf.default.secure_redirects',
      permanent => 'yes',
      value     => '0',
    }
    file_line { '(3.2.3) - Ensure default secure ICMP redirects are not accepted (Scored)':
      ensure => present,
      path   => $file,
      line   => 'net.ipv4.conf.default.secure_redirects = 0',
      match  => '^net.ipv4.conf.default.secure_redirects',
      }


} #EOF
