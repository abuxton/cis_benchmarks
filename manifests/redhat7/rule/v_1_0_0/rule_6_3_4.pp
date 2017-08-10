class cis_benchmarks::redhat7::rule::v_1_0_0::rule_6_3_4 {

  # 6.3.4 has been moved into rule_6_3_2.pp file

  #includes Rules:
  # 6.3.4 - Limit Password Reuse (Scored)
  #
  #pam { '(6.3.4) - system-auth: pam_unix.so (sufficient)':
  #  ensure    => present,
  #  service   => 'system-auth',
  #  type      => 'password',
  #  control   => 'sufficient',
  #  module    => 'pam_unix.so',
  #  arguments => 'remember=5',
  #}

} #EOF
