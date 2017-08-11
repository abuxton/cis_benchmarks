# 1.3.1 Ensure AIDE is installed (Scored)
# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_3_1 (
  Optional[String] $cis_aide_hour = lookup("cis_benchmarks::${::cis_benchmarks::cis_version}::cis_aide_hour",String,'first',$cis_benchmarks::params::cis_aide_hour),
    ) inherits ::cis_benchmarks::params {
  package { '(1.3.1) - AIDE is installed':
      ensure => present,
      name   => 'aide',
  }
  exec { '(1.3.1) - Initialize AIDE':
    path    => [ '/usr/bin', '/usr/sbin', '/bin' ],
    command => "aide --init -B 'database_out=file:/var/lib/aide/aide.db.gz'",
    creates => '/var/lib/aide/aide.db.gz',
  }
  cron { '(1.3.2) - cron AIDE':
    command => '/usr/sbin/aide --check',
    user    => 'root',
    hour    => [$cis_aide_hour],
  }
} #EOF
