class mtn_cis::redhat7::rule::v_1_0_0::rule_4_5_2 {
  # includes Rules:
  # 4.5.2 - Create /etc/hosts.allow (Not Scored)
  # 4.5.3 - Verify Permissions on /etc/hosts.allow (Scored)

  $file = '/etc/hosts.allow'

  file_line { "(4.5.2) - ${file}: ADD: net/mask":
    ensure   => present,
    path     => $file,
    #line     => 'ALL: <net>/<mask',
    line     => 'ALL: ALL',
    match    => '^ALL.?:.?\d{2,}.\d{2,}.\d{1,}.\d{1,}\/\d{2,}.\d{2,}.\d{1,}.\d{1,}',
    multiple => true,
    replace  => false,
  }

  file { "(4.5.3) - ${file} has 644 permissions":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }


} #EOF
