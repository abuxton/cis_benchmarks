# 1.2.2 Ensure gpgcheck is globally activated (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_2_2 {


  file { '/etc/yum.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  file_line { '(1.2.2) /etc/yum.conf contains gpgcheck=1':
    ensure => present,
    path   => '/etc/yum.conf',
    line   => 'gpgcheck=1',
  }
  exec{ '(1.2.2) Ensure gpgcheck is globally activated (Scored): Failed':
    command => 'sed -i /^gpgcheck*/d /etc/yum.repos.d/*.repo',
    path    => '/sbin:/bin',
    onlyif  => 'test  $(grep  ^gpgcheck /etc/yum.repos.d/* | wc -l) -gt 0',
  }





}#EOF
