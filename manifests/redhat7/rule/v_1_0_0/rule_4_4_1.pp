class mtn_cis::redhat7::rule::v_1_0_0::rule_4_4_1 {
  # includes Rules:
  # 4.4.1.1 - Disable IP Forwarding (Scored)
  # 4.4.1.2 - Disable Send Packet Redirects (Scored)
  # 4.4.2 - Disable IPv6 (Not Scored)

  $file = '/etc/sysctl.conf'

  file_line { "(4.4.1.1) - ${file}: all.accept_ra=0":
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.accept_redirects=0',
    match  => '^net.ipv4.conf.all.accept_redirects',
  }

  file_line { "(4.4.1.1) - ${file}: default.accept_ra=0":
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.default.accept_ra=0',
    match  => '^net.ipv4.conf.default.accept_ra=0',
  }

  file_line { "(4.4.1.2) - ${file}: all.accept_redirects=0":
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.all.accept_redirects=0',
    match  => '^net.ipv4.conf.all.accept_redirects',
  }

  file_line { "(4.4.1.2) - ${file}: default.accept_redirects=0":
    ensure => present,
    path   => $file,
    line   => 'net.ipv4.conf.default.accept_redirects=0',
    match  => '^net.ipv4.conf.default.accept_redirects',
  }

  file_line { "(4.4.2) - ${file}: all.disable_ipv6=1":
    ensure => present,
    path   => $file,
    line   => 'net.ipv6.conf.all.disable_ipv6=1',
    match  => '^net.ipv6.conf.all.disable_ipv6',
  }

  file_line { '(4.4.2) - disable IPv6 in /etc/sysconfig/network':
    ensure => present,
    path   => '/etc/sysconfig/network',
    line   => 'IPV6INIT=no',
    match  => '^IPV6INIT',
  }

  file_line { '(4.4.2) - disable IPv6 Networking':
    ensure => present,
    path   => '/etc/sysconfig/network',
    line   => 'NETWORKING_IPV6=no',
    match  => '^NETWORKING_IPV6',
  }



} #EOF
