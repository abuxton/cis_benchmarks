# replaces cis_benchmarks::redhat7::rule::v_1_0_0::rule_5_1_1
class cis_benchmarks::redhat7::rule::v_1_0_0::rule_5_1_1 (
  String $remotelogserver = lookup("${cis_benchmarks::cis_version_base}::remotelogserver"),
  Hash $rsyslogcontent    = lookup("${cis_benchmarks::cis_version_base}::rsyslogcontent"),
) {

  $file = '/etc/rsyslog.conf'

  # includes Rules:
  # 5.1.1 - Install the rsyslog package (Scored)
  # 5.1.2 - Activate the rsyslog Service (Scored)
  # 5.1.3 - Configure /etc/rsyslog.conf (Not Scored)
  # 5.1.4 - Create and Set Permissions on rsyslog Log Files (Scored)
  # 5.1.5 - Configure rsyslog to Send Logs to a Remote Log Host (Scored)
  # 5.1.6 - Accept Remote rsyslog Messages Only on Designated Log Hosts (Not Scored)

  package { '(5.1.1) - Rsyslog installed':
    ensure => installed,
    name   => 'rsyslog',
  }

  service { '(5.1.2) - Rsyslog service running':
    ensure    => running,
    name      => 'rsyslog',
    subscribe => File['(5.1.3) - /etc/rsyslog.conf exists'],
  }

  file { "(5.1.3) - ${file} exists":
    ensure  => file,
    name    => $file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => Package['(5.1.1) - Rsyslog installed'],
  }
  -> exec { 'Ensure /etc/rsyslog.d/* files are also mode 0600':
    command => 'chmod 600 /etc/rsyslog.d/*',
    path    => [ '/bin', '/sbin' ],
  }

  $rsyslogcontent.each |$facility, $destlog| {
    $logfile = regsubst ($destlog,'^-','')

    file_line { "(5.1.3) - ${file}: contains  ${logfile}":
      ensure => present,
      path   => $file,
      line   => "${facility} ${destlog}",
    }

    file { "(5.1.4) - ${logfile} permissions: 0600":
      ensure => present,
      path   => $logfile,
      mode   => '0600',
      owner  => root,
      group  => root,
    }
  }

  file_line { "(5.1.5) - ${file}: Remote host configured":
    ensure  => present,
    path    => $file,
    line    => "*.* @@${remotelogserver}",
    match   => '^*.*.@@.*$',
    replace => true,
  }

  file_line { "(5.1.6) - ${file}: \$ModLoad imtcp.so":
    ensure => present,
    path   => $file,
    line   => '$ModLoad imtcp.so',
  }

  file_line { "(5.1.6) - ${file}: \$InputTCPServerRun 514":
    ensure => present,
    path   => $file,
    line   => '$InputTCPServerRun 514',
  }

} #EOF
