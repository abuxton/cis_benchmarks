# 4.2.1 Configure rsyslog
# 4.2.1.1 Ensure rsyslog Service is enabled (Scored)
# 4.2.1.2 Ensure logging is configured (Not Scored)
# 4.2.1.3 Ensure rsyslog default file permissions configured (Scored)
# 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host (Scored)
# 4.2.4 Ensure permissions on all logfiles are configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_2_1(
  String $remotelog_server = lookup("${cis_benchmarks::cis_version_base}::remotelog_server"),
  Hash $rsyslog_content    = lookup("${cis_benchmarks::cis_version_base}::rsyslog_content"),
) {
  $file = '/etc/rsyslog.conf'
  package { '(4.2.1) - Ensure rsyslog Package is installed':
    ensure => installed,
    name   => 'rsyslog',
  }
  service { '(4.2.1.1) - Ensure rsyslog Service is enabled (Scored)':
    ensure    => running,
    enable    => true,
    name      => 'rsyslog',
    subscribe => Package['(4.2.1) - Ensure rsyslog Package is installed'],
  }
  file { "(4.2.1.2) - ${file} exists":
    ensure  => file,
    name    => $file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['(4.2.1) - Ensure rsyslog Package is installed'],
    notify  => Service['(4.2.1.1) - Ensure rsyslog Service is enabled (Scored)'],
  }
  -> exec { 'Ensure /etc/rsyslog.d/* files are also mode 0600':
    command => 'chmod 600 /etc/rsyslog.d/*',
    path    => [ '/bin', '/sbin' ],
  }

  $rsyslog_content.each |$facility, $destlog| {
    $logfile = regsubst ($destlog,'^-','')

    file_line { "(4.2.1.2) - ${file}: contains  ${logfile}":
      ensure => present,
      path   => $file,
      line   => "${facility} ${destlog}",
      notify => Service['(4.2.1.1) - Ensure rsyslog Service is enabled (Scored)'],
    }

    file { "(4.2.4) - ${logfile} permissions: 0600":
      ensure => present,
      path   => $logfile,
      mode   => '0600',
      owner  => root,
      group  => root,
    }
  }

  file_line { "(4.2.1.4) - ${file}: Remote host configured":
    ensure  => present,
    path    => $file,
    line    => "*.* @@${remotelog_server}",
    match   => '^*.*.@@.*$',
    replace => true,
    notify  => Service['(4.2.1.1) - Ensure rsyslog Service is enabled (Scored)'],
  }

  file_line { "(4.2.1.4) - ${file}: \$ModLoad imtcp.so":
    ensure => present,
    path   => $file,
    line   => '$ModLoad imtcp.so',
    notify => Service['(4.2.1.1) - Ensure rsyslog Service is enabled (Scored)'],
  }

  file_line { "(4.2.1.4) - ${file}: \$InputTCPServerRun 514":
    ensure => present,
    path   => $file,
    line   => '$InputTCPServerRun 514',
    notify => Service['(4.2.1.1) - Ensure rsyslog Service is enabled (Scored)'],
  }
} #EOF
