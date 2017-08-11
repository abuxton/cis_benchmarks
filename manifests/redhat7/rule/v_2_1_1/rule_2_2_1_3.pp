# 2.2.1.3 Ensure chrony is configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_1_3 (
  Optional['chrony','ntp'] $time_service = lookup("cis_benchmarks::${cis_version}::time_service",String,'first',$cis_benchmarks::params::time_service),
  String $time_server = lookup("cis_benchmarks::${cis_version}::time_server",String,'first',$cis_benchmarks::params::time_server),
  ) inherits ::cis_benchmarks::params{

    $file='/etc/chrony.conf'
    if !defined(File['/etc/sysconfig/ntpd']){
      file{ "(2.2.1.3) - ${file} exists":
        ensure => file,
        path   => $file,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        after  => Package[$time_server]
      }
    }
    file_line { "(2.2.1.3) ${file} - ensure ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS":
      ensure => present,
      path   => $file,
      line   => 'ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS',
    }
    file_line { "(2.2.1.3) ${file} - ensure ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS present":
      ensure => present,
      path   => $file,
      line   => 'ExecStart=/usr/sbin/ntpd -u ntp:ntp $OPTIONS',
    }
    file_line { "(2.2.1.2) ${file} - ensure OPTIONS="-u ntp:ntp absent":
      ensure => absent,
      path   => $file,
      line   => 'OPTIONS="-u ntp:ntp"',
    }


} #EOF
