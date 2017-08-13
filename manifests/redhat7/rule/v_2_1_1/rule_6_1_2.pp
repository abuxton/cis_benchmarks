# 6.1 System File Permissions
# This section provides guidance on securing aspects of system files and directories.
# 6.1.2 Ensure permissions on /etc/passwd are configured (Scored)
# 6.1.3 Ensure permissions on /etc/shadow are configured (Scored)
# 6.1.4 Ensure permissions on /etc/group are configured (Scored)
# 6.1.5 Ensure permissions on /etc/gshadow are configured (Scored
# 6.1.6 Ensure permissions on /etc/passwd- are configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_2 {
  file { '(6.1.2,6.1.6) Ensure permissions on /etc/passwd are configured (Scored)':
    ensure => file,
    path   => '/etc/passwd',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '(6.1.3,6.1.7) Ensure permissions on /etc/shadow are configured (Scored)':
    ensure => file,
    path   => '/etc/shadow',
    owner  => 'root',
    group  => 'root',
    mode   => '0000',
  }


  file { '(6.1.4,6.1.8) Ensure permissions on /etc/group are configured (Scored)':
    ensure => file,
    path   => '/etc/group',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  file { '(6.1.5,6.1.9) Ensure permissions on /etc/gshadow are configured (Scored':
      ensure => file,
      path   => '/etc/gshadow',
      owner  => 'root',
      group  => 'root',
      mode   => '0000',
    }

} #EOF
