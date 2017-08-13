# 6.1 System File Permissions
# This section provides guidance on securing aspects of system files and directories.
# 6.1.1 Audit system file permissions (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_1 (
  String $schedule_range = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::schedule_range", String, 'first', '1-12'),
  String $schedule_period = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::schedule_period", String, 'first', 'daily'),
  String $schedule_repeat = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::schedule_repeat", String, 'first', '1'),
  String $cis_scripts_dir = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::cis_scripts_dir", String, 'first','/tmp/cis_scripts'),
){
  # includes Rules:
  # 1.2.6 - Verify Package Integrity Using RPM (Not Scored)

  schedule { 'exec cis_pkg_integrity.sh':
    range  => $schedule_range,
    period => $schedule_period,
    repeat => $schedule_repeat,
  }
  exec { "${cis_scripts_dir}/cis_pkg_integrity.sh":
    path      =>  '/usr/bin',
    schedule  =>  'exec cis_pkg_integrity.sh',
  }
  $pkg = $::cis_benchmarks['pkg_integrity']

  if $pkg != ''
  {
    notify { '6.1.1 Audit system file permissions (Not Scored), Installed packages did not pass integrity check': }
  }

} #EOF
