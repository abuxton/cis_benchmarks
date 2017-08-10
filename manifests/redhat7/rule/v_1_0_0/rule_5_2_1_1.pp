class mtn_cis::redhat7::rule::v_1_0_0::rule_5_2_1_1 {

  # includes Rules:
  # 5.2.1.1 - Configure Audit Log Storage Size (Not Scored)
  # 5.2.1.2 - Disable System on Audit Log Full (Not Scored)
  # 5.2.1.3 - Keep All Auditing Information (Scored)
  # 5.2.2 - Enable auditd Service (Scored)

  $file = '/etc/audit/auditd.conf'

  package { '(5.2) Ensure audit package is installed':
    ensure => present,
    name   => 'audit',
  }

  file_line { "(5.2.1.1) - ${file}: max_log_file":
    ensure   => present,
    path     => $file,
    line     => 'max_log_file = <MB>',
    match    => '^max_log_file.?=.?\d{1,}',
    multiple => false,
    replace  => false,
    require  => Package['(5.2) Ensure audit package is installed'],
  }

  file_line { "(5.2.1.2) - ${file}: space_left_action":
    ensure   => present,
    path     => $file,
    line     => 'space_left_action = email',
    match    => '^space_left_action.?=.?email',
    multiple => false,
    replace  => false,
    require  => Package['(5.2) Ensure audit package is installed'],
  }

  file_line { "(5.2.1.2) - ${file}: action_mail_acct":
    ensure   => present,
    path     => $file,
    line     => 'action_mail_acct = root',
    match    => '^action_mail_acct.?=.?root',
    multiple => false,
    replace  => false,
    require  => Package['(5.2) Ensure audit package is installed'],
  }

  file_line { "(5.2.1.2) - ${file}: admin_space_left_action":
    ensure   => present,
    path     => $file,
    line     => 'admin_space_left_action = halt',
    match    => '^admin_space_left_action.?=.?halt',
    multiple => false,
    replace  => false,
    require  => Package['(5.2) Ensure audit package is installed'],
  }

  file_line { "(5.2.1.3) - ${file}: max_log_file_action":
    ensure   => present,
    path     => $file,
    line     => 'max_log_file_action = keep_logs',
    match    => 'max_log_file_action = ROTATE',
    multiple => false,
    require  => Package['(5.2) Ensure audit package is installed'],
  }

  #service { '(5.2.2) - auditd service enabled':
  #  name    => 'auditd',
  #  ensure  => running,
  #  enable  => true,
  #  require => Package['(5.2) Ensure audit package is installed'],
  #}

} #EOF
