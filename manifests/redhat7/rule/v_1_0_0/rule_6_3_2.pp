class mtn_cis::redhat7::rule::v_1_0_0::rule_6_3_2 {
  #includes Rules:
  # 6.3.2 - Set Password Creation Requirement Parameters Using pam_cracklib (Scored)
  # 6.3.3 - Set Lockout for Failed Password Attempts (Not Scored)
  # 6.3.4 - Limit Password Reuse (Scored)

  file { '(6.3.2) - /etc/pam.d/system-auth is a symlink':
    ensure => link,
    path   => '/etc/pam.d/system-auth',
    target => 'system-auth-ac',
  }

  file { '(6.3.2) - /etc/pam.d/system-auth-ac permissions':
    ensure  => file,
    path    => '/etc/pam.d/system-auth-ac',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => epp('mtn_cis/system-auth.epp'), # 6.3.3
  }

  file {'(6.3.2) - /etc/security/pwquality.conf content':
    ensure  => present,
    path    => '/etc/security/pwquality.conf',
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('mtn_cis/pwquality.conf.epp'),
  }


} #EOF
