# 5.6 Ensure access to the su command is restricted (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_6{

    file_line { "(5.6) - Restrict access to 'su' command":
      ensure  => present,
      path    => '/etc/pam.d/su',
      line    => 'auth 	required pam_wheel.so use_uid',
      match   => '^#auth.*required.*pam_wheel.so',
      replace => true,
    }
} #EOF
