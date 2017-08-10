class mtn_cis::redhat7::rule::v_1_0_0::rule_6_3_3 {
  #includes Rules:
  # 6.3.3 - Set Lockout for Failed Password Attempts (Not Scored)

  file { '(6.3.3) - /etc/pam.d/password-auth is a symlink':
    ensure => link,
    path   => '/etc/pam.d/password-auth',
    target => 'password-auth-ac',
  }

  file {'(6.3.3) - password-auth (required)':
    ensure  => present,
    path    => '/etc/pam.d/password-auth-ac',
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('cis_rhel7/password-auth.epp'),
  }

  #pam { '(6.3.3) - system-auth: pam_env.so (required)':
  # /etc/pam.d/system-auth-ac file setup is handled in rule_6_3_2.pp file

} #EOF
