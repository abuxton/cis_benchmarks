class cis_benchmarks::redhat7::rule::v_1_0_0::rule_6_5 {

  #includes Rules:
  # 6.5   - Restrict Access to the su Command (Scored)

  file_line { "(6.5) - Restrict access to 'su' command":
    ensure  => present,
    path    => '/etc/pam.d/su',
    line    => 'auth 	required pam_wheel.so use_uid',
    match   => '^#auth.*required.*pam_wheel.so',
    replace => true,
  }

} #EOF
