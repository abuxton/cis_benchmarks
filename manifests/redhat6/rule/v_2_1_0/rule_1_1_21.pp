# 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_21 {

  $ww_dirs = $::cis_benchmarks['ww_dirs']

  if ($ww_dirs != '') {
      notify { '(1.1.21) Ensure sticky bit is set on all world-writable directories (Scored): FAILED': }
  }
}#EOF
