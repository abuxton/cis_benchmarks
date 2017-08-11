# 1.1.2 Ensure separate partition exists for /tmp (Scored)
# 1.1.3 Ensure nodev option set on /tmp partition (Scored)
# 1.1.4 Ensure nosuid option set on /tmp partition (Scored)
# 1.1.5 Ensure noexec option set on /tmp partition (Scored)

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_2{
  file { '(1.1.2) "/tmp" properties':
    ensure => 'directory',
    path   => '/tmp',
    mode   => '1777',
    owner  => 'root',
    group  => 'root',
  }

  mount { '(1.1.3 - 1.1.5) /tmp is mounted':
    ensure  => 'mounted',
    name    => '/tmp',
    device  => '/tmp',
    fstype  => 'tmpfs',
    options => 'nodev,nosuid,noexec'
  }

  } #EOF
