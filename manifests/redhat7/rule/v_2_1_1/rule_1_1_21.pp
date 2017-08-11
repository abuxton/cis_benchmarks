# 1.1.21 Ensure sticky bit is set on all world-writable directories (Scored)

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_21 {

  #includes Rules:
  # 1.1.17 - Set Sticky Bit on All World-Writable Directories (Scored)

  $ww_dirs = $::cis_benchmarks['ww_dirs']

  if ($ww_dirs != '') {
      notify { "(1.1.17) sticky bit not set on: ${ww_dirs}": }
  }



}#EOF
