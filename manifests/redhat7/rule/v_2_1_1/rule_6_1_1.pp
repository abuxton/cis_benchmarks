# 6.1 System File Permissions
# This section provides guidance on securing aspects of system files and directories.
# 6.1.1 Audit system file permissions (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_1 (
  String $schedule_range = lookup("${cis_benchmarks::cis_version_base}::integrity_schedule_range"),
  String $schedule_period = lookup("${cis_benchmarks::cis_version_base}::integrity_schedule_period"),
  String $schedule_repeat = lookup("${cis_benchmarks::cis_version_base}::integrity_schedule_repeat"),
) {
  # includes Rules:
  # 1.2.6 - Verify Package Integrity Using RPM (Not Scored)

  schedule { 'exec cis_pkg_integrity.sh':
    range  => $schedule_range,
    period => $schedule_period,
    repeat => $schedule_repeat,
  }
  exec { "${cis_benchmarks::scripts_dir}/cis_pkg_integrity.sh":
    path     =>  '/usr/bin',
    schedule =>  'exec cis_pkg_integrity.sh',
  }
  $pkg = $::cis_benchmarks['pkg_integrity']

  if $pkg != ''
  {
    notify { '6.1.1 Audit system file permissions (Not Scored), Installed packages did not pass integrity check': }
  }

} #EOF
