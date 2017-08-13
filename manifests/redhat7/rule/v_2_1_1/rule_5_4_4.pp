# 5.4.4 Ensure default user umask is 027 or more restrictive (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_4_4 {
  $file = '/etc/bashrc'

  file { "5.4.4 Ensure default user umask is 027 or more restrictive (Scored) - ${file} exists":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file_line { "5.4.4 Ensure default user umask is 027 or more restrictive (Scored)":
    ensure => present,
    path   => $file,
    line   => 'umask 027',
  }

  file { '/etc/profile.d/cis.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => 'umask 027',
  }
} #EOF
