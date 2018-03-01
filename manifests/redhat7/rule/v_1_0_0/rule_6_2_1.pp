class cis_benchmarks::redhat7::rule::v_1_0_0::rule_6_2_1 (
  Hash $settings = lookup({'name' => "${cis_benchmarks::cis_version_base}::sshd_settings", 'default_value' => {}),
) {
  # includes Rules:
  # 6.2.1 - Set SSH Protocol to 2 (Scored)
  # 6.2.2 - Set LogLevel to INFO (Scored)
  # 6.2.3 - Set Permissions on /etc/ssh/sshd_config (Scored)
  # 6.2.4 - Disable SSH X11 Forwarding (Scored)
  # 6.2.5 - Set SSH MaxAuthTries to 4 or Less (Scored)
  # 6.2.6 - Set SSH IgnoreRhosts to Yes (Scored)
  # 6.2.7 - Set SSH HostbasedAuthentication to No (Scored)
  # 6.2.8 - Disable SSH Root Login (Scored)
  # 6.2.9 - Set SSH PermitEmptyPasswords to No (Scored)
  # 6.2.10 - Do Not Allow Users to Set Environment Options (Scored)
  # 6.2.11 - Use Only Approved Cipher in Counter Mode (Scored)
  # 6.2.12 - Set Idle Timeout Interval for User Login (Scored)
  # 6.2.13 - Limit Access via SSH (Scored)
  # 6.2.14 - Set SSH Banner (Scored)

  $file = '/etc/ssh/sshd_config'

  $settings.each |$setting, $rule| {
    file_line { "${rule} - ${file}: ${setting}":
      ensure => present,
      path   => $file,
      line   => $setting,
      notify => Exec['restart ssh daemon'],
    }
  }

  file { "(6.2.3) - ${file} permissions":
    ensure => file,
    name   => $file,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
    notify => Exec['restart ssh daemon']
  }

  exec { 'restart ssh daemon':
    path        => ['/sbin','/bin'],
    command     => 'systemctl restart sshd',
    refreshonly => true,
  }

} #EOF
