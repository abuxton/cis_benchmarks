class mtn_cis::redhat7::rule::v_1_0_0::rule_1_1_17 {

  #includes Rules:
  # 1.1.17 - Set Sticky Bit on All World-Writable Directories (Scored)

  $ww_dirs = $::cis_benchmarks['ww_dirs']

  if ($ww_dirs != '') {
      notify { "(1.1.17) sticky bit not set on: ${ww_dirs}": }
  }


} #EOF
