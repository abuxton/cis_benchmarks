# replaces cis_benchmarks::redhat7::rule::v_1_0_0::rule_5_3
#wrong tpe of param for hash usage
class cis_benchmarks::redhat7::rule::v_1_0_0::rule_5_3 (
  Array $logs = lookup("${cis_benchmarks::cis_version_base}::logs"),
) {
  # includes Rules:
  # 5.3 - Configure logrotate (Not Scored)
  $file = '/etc/logrotate.d/syslog'

  file { $file:
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('cis_benchmarks/logrotate_syslog.epp',{ logs => $logs }),
  }

} #EOF
