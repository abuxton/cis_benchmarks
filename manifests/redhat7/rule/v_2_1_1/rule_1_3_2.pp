# 1.3.1 Ensure AIDE is installed (Scored)
# 1.3.2 Ensure filesystem integrity is regularly checked (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_3_2 (
  Optional[String] $cis_aide_hour = lookup("cis_benchmarks::${::cis_benchmarks::cis_version}::cis_aide_hour",String,'first',$cis_benchmarks::params::cis_aide_hour),
    ) inherits ::cis_benchmarks::params {

  cron { '(1.3.2) - cron AIDE':
    command => '/usr/sbin/aide --check',
    user    => 'root',
    hour    => [$cis_aide_hour],
    require => Package['(1.3.1) - AIDE is installed'],
  }
} #EOF
