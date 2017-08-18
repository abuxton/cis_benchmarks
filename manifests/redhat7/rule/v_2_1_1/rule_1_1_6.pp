# 1.1.6 Ensure separate partition exists for /var (Scored)
# 1.1.7 Ensure separate partition exists for /var/tmp (Scored)
# 1.1.8 Ensure nodev option set on /var/tmp partition (Scored
# 1.1.9 Ensure nosuid option set on /var/tmp partition (Scored)
# 1.1.10 Ensure noexec option set on /var/tmp partition (Scored)

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_6{
  file_line { '(1.1.6) /var is mounted':
    ensure => present,
    path   => '/etc/fstab',
    line   => '#<volume>  /var  <fstype>  nodev 0 0',
    match  => '\*/var',
    replace => false,
  }
  mount { '(1.1.7 - 1.1.9) /var/tmp is bound to /tmp':
    ensure  => 'mounted',
    name    => '/var/tmp',
    device  => '/tmp',
    fstype  => 'none',
    options => 'bind',
  }
}#EOF
