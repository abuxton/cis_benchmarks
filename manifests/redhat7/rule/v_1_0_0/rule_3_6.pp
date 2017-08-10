class cis_benchmarks::redhat7::rule::v_1_0_0::rule_3_6 {
  # includes Rules:
  # 3.6 - Configure Network Time Protocol (NTP) (Scored)

  package { '(3.6) - NTP installed':
    ensure => present,
    name   => 'ntp',
  }

  $file = '/etc/ntp.conf'

  file { '(3.6) - NTP conf file exists':
    ensure  => file,
    path    => $file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['(3.6) - NTP installed'],
  }
  -> file_line { "(3.6) - restrict default in ${file}":
    ensure => present,
    path   => $file,
    line   => 'restrict default kod nomodify notrap nopeer noquery'
  }
  -> file_line { "(3.6) - restrict -6 default in ${file}":
    ensure => present,
    path   => $file,
    line   => 'restrict -6 default kod nomodify notrap nopeer noquery'
  }
  -> file_line { "(3.6) - ${file} contains NTP servers":
    ensure   => present,
    path     => $file,
    line     => 'server',
    match    => '^server.*$',
    multiple => true,
    replace  => false,
  }
  -> file_line { '(3.6) - /etc/sysconfig/ntpd OPTIONS':
    ensure => present,
    path   => '/etc/sysconfig/ntpd',
    line   => 'OPTIONS="-u ntp:ntp -p /var/run/ntpd.pid"',
    match  => '^OPTIONS.*$',
  }
  -> service { '(3.6) - NTP service running':
    ensure => running,
    name   => 'ntpd',
  }

} #EOF
