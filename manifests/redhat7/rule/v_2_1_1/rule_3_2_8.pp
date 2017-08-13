# 3.2 Network Parameters (Host and Router)
# 3.2.8 Ensure TCP SYN Cookies is enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_2_8 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$file]) {
    file{ $file :
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  sysctl { '(3.2.8) - Ensure all TCP SYN Cookies is enabled (Scored)':
    name      => 'net.ipv4.tcp_syncookies',
    permanent => 'yes',
    value     => '1',
  }
  file_line { '(3.2.8) - Ensure all TCP SYN Cookies is enabled (Scored)':
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.tcp_syncookies = 1',
    match  => '^net.ipv4.tcp_syncookies',
    }



} #EOF
