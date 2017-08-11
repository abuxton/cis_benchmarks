# 1.2.2 Ensure gpgcheck is globally activated (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_2_2 {

  file { '/etc/yum.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file_line { '(1.2.3) /etc/yum.conf contains gpgcheck=1':
    ensure => present,
    path   => '/etc/yum.conf',
    line   => 'gpgcheck=1',
  }

}#EOF
