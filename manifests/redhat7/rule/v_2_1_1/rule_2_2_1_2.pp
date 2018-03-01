# 2.2.1.2 Ensure ntp is configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_1_2 (
  Enum['chrony','ntp'] $time_service = lookup("${cis_benchmarks::cis_version_base}::time_service"),
  String               $time_server = lookup("${cis_benchmarks::cis_version_base}::time_server"),
) {

    $file  =  '/etc/sysconfig/ntpd'
    $conf_file  = '/etc/ntp.conf'

    if !defined(File[$file]){
      file{ "(2.2.1.2) - ${file} exists":
        ensure  => file,
        path    => $file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        require => Package[$time_service],
      }
    }
    file_line { "(2.2.1.2) ${file} - ensure ExecStart=/usr/sbin/ntpd -u ntp:ntp present":
      ensure  => present,
      path    => $file,
      line    => 'ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS',
      require => Package[$time_service],
    }
    file_line { "(2.2.1.2) ${file} - ensure OPTIONS='-u ntp:ntp absent' ":
      ensure  => absent,
      path    => $file,
      line    => 'OPTIONS="-u ntp:ntp"',
      require => Package[$time_service],
    }
    file_line { "(2.2.1.2) ${conf_file} - ensure server present":
      ensure  => absent,
      path    => $conf_file,
      line    => "server ${time_server}",
      require => Package[$time_service],
    }
    file_line { "(2.2.1.2) ${conf_file} - ensure restrict -4 present":
      ensure  => absent,
      path    => $conf_file,
      line    => 'restrict -4 default kod nomodify notrap nopeer noquery',
      require => Package[$time_service],
    }
    file_line { "(2.2.1.2) ${conf_file} - ensure restrict -6 present":
      ensure  => absent,
      path    => $conf_file,
      line    => 'restrict -6 default kod nomodify notrap nopeer noquery',
      require => Package[$time_service],
    }


} #EOF
