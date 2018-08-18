# 2.2.1.3 Ensure chrony is configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_1_3 (
  Enum['chrony','ntp'] $time_service = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::time_service",String,'first',$cis_benchmarks::params::time_service),
  String $time_server = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::time_server",String,'first',$cis_benchmarks::params::time_server),
  ) inherits ::cis_benchmarks::params{

    $conf_file='/etc/chrony.conf'
    $file = '/etc/sysconfig/chronyd'

    file_line { "(2.2.1.3) ${conf_file} - ensure server":
      ensure  => present,
      path    => $conf_file,
      line    => "server ${time_server}",
      require => Package["(2.2.1) install ${time_service}"],
    }

    file_line { "(2.2.1.3) ${file} - ensure OPTIONS='-u chrony'":
      ensure  => absent,
      path    => $file,
      line    => 'OPTIONS="-u chrony"',
      require => Package["(2.2.1) install ${time_service}"],
    }

} #EOF
