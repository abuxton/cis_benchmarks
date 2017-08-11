# s
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq{

  $file = '/etc/modprobe.d/CIS.conf'

  file { '/etc/modprobe.d':
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { $file :
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => File['/etc/modprobe.d'],
  }

} #EOF
