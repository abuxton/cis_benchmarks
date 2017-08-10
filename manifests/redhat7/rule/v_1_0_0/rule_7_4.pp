class cis_benchmarks::redhat7::rule::v_1_0_0::rule_7_4 {
  #includes Rules:
  # 7.4 - Set Default umask for Users (Scored)

  $file = '/etc/bashrc'

  file { "(7.4) - ${file} exists":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file_line { "(7.4) - Set umask 077 on ${file}":
    ensure => present,
    path   => $file,
    line   => 'umask 077',
  }

  file { '/etc/profile.d/cis.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0600',
    content => 'umask 077',
  }

} #EOF
