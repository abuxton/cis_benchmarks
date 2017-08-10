class cis_benchmarks::redhat7::rule::v_1_0_0::rule_5_2_4 {
  # includes Rules:
  # 5.2.4 - Record Events That Modify Date and Time Information (Scored)
  # 5.2.5 - Record Events That Modify User/Group Information (Scored)
  # 5.2.6 - Record Events That Modify the System's Network Environment (Scored)
  # 5.2.7 - Record Events That Modify the System's Mandatory Access Controls (Scored)
  # 5.2.8 - Collect Login and Logout Events (Scored)
  # 5.2.9 - Collect Session Initiation Information (Scored)
  # 5.2.10 - Collect Discretionary Access Control Permission Modification Events (Scored)
  # 5.2.11 - Collect Unsuccessful Unauthorized Access Attempts to Files (Scored)
  # 5.2.13 - Collect Successful File System Mounts (Scored)
  # 5.2.14 - Collect File Deletion Events by User (Scored)
  # 5.2.15 - Collect Changes to System Administration Scope (sudoers) (Scored)
  # 5.2.16 - Collect System Administrator Actions (sudolog) (Scored)
  # 5.2.17 - Collect Kernel Module Loading and Unloading (Scored)
  # 5.2.18 - Make the Audit Configuration Immutable (Scored)

  file { '/etc/audit/rules.d/cis.rules':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('cis_benchmarks/cis.rules.epp'),
  }
  ~> exec { 'restartauditd':
    command     => '/usr/libexec/initscripts/legacy-actions/auditd/restart',
    refreshonly => true,
    returns     => [ 0, 1 ],
  }

  # Install the cron job that will generate new audit rule file that will watch all setuid and setgid binaries (5.2.12)
  file { '/etc/cron.daily/tagprivileged.sh':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0750',
    content => epp('cis_benchmarks/tagprivileged.sh.epp'),
  }
  ~> exec { 'initial tagging of privileged binaries':
    command     => '/etc/cron.daily/tagprivileged.sh',
    refreshonly => true,
  }

} #EOF
