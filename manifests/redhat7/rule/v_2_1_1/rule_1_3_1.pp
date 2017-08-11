# 1.3.1 Ensure AIDE is installed (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_3_1{
  package { '(1.3.1) - AIDE is installed':
      ensure => present,
      name   => 'aide',
  }
  exec { '(1.3.1) - Initialize AIDE':
    path    => [ '/usr/bin', '/usr/sbin', '/bin' ],
    command => "aide --init -B 'database_out=file:/var/lib/aide/aide.db.gz'",
    creates => '/var/lib/aide/aide.db.gz',
  }
} #EOF
