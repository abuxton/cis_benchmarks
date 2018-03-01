# 1.2.6 - Verify Package Integrity Using RPM (Not Scored)
class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_2_6 (
  String $schedule_range  = lookup("${cis_benchmarks::cis_version_base}::integrity_schedule_range"),
  String $schedule_period = lookup("${cis_benchmarks::cis_version_base}::integrity_schedule_period"),
  String $schedule_repeat = lookup("${cis_benchmarks::cis_version_base}::integrity_schedule_repeat"),
) {

  schedule { 'exec cis_pkg_integrity.sh':
    range  => $schedule_range,
    period => $schedule_period,
    repeat => $schedule_repeat,
  }
  exec { "${cis_benchmarks::scripts_dir}/cis_pkg_integrity.sh":
    path      =>  '/usr/bin',
    schedule  =>  'exec cis_pkg_integrity.sh',
  }
  $pkg = $::cis_benchmarks['pkg_integrity']

  if $pkg != ''
  {
    notify { '(1.2.6) - Installed packages did not pass integrity check': }
  }

} #EOF
