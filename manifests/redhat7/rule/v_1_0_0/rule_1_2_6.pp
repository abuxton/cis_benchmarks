#
class mtn_cis::redhat7::rule::v_1_0_0::rule_1_2_6 (
  String $schedule_range = lookup('mtn_cis::redhat7::rule::v_1_0_0::rule_1_2_6::schedule_range', String, 'first', '1-12'),
  String $schedule_period = lookup('mtn_cis::redhat7::rule::v_1_0_0::rule_1_2_6::schedule_period', String, 'first', 'daily'),
  String $schedule_repeat = lookup('mtn_cis::redhat7::rule::v_1_0_0::rule_1_2_6::schedule_repeat', String, 'first', '1'),
  String $cis_scripts_dir = lookup('mtn_cis::cis_scripts_dir', String, 'first','/tmp/cis_scripts'),
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
    notify { '(1.2.6) - Installed packages did not pass integrity check': }
  }

} #EOF
