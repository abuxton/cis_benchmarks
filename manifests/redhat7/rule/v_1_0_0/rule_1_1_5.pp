class mtn_cis::redhat7::rule::v_1_0_0::rule_1_1_5 {

  # includes Rules:
  # 1.1.5, 1.1.6

  file_line { '(1.1.5) /var is mounted':
    ensure => present,
    path   => '/etc/fstab',
    line   => '#<volume>  /var  <fstype>  nodev 0 0',
    #match  => '\*/var',
  }


  mount { '(1.1.6) /var/tmp is bound to /tmp':
    ensure  => 'mounted',
    name    => '/var/tmp',
    device  => '/tmp',
    fstype  => 'none',
    options => 'bind',
  }

} #EOF
