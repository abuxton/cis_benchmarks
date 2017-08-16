# 5.2 Configure ssh
# 5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured (Scored)
# 5.2.2 Ensure SSH Protocol is set to 2 (Scored)
# 5.2.3 Ensure SSH LogLevel is set to INFO (Scored)
# 5.2.4 Ensure SSH X11 forwarding is disabled (Scored)
# 5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)
# 5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)
# 5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)
# 5.2.8 Ensure SSH root login is disabled (Scored)
# 5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)
# 5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)
# 5.2.11 Ensure only approved ciphers are used (Scored)
# 5.2.12 Ensure only approved MAC algorithms are used (Scored)
# 5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored)
# 5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored)
# 5.2.15 Ensure SSH access is limited (Scored)
# 5.2.16 Ensure SSH warning banner is configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_2 (
  Boolean $manage_ssh =  lookup("cis_benchmarks::${cis_benchmarks::cis_version}::cis_manage_ssh", Boolean, 'first', $cis_benchmarks::params::cis_manage_ssh),
  Hash $cis_ssh_settings = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::cis_sshd_settings", Hash, 'first',$cis_benchmarks::params::cis_ssh_settings),
  ) inherits ::cis_benchmarks::params {
  if $manage_ssh{
    $file = '/etc/ssh/sshd_config'
    service {'(5.2) - Ensure SSH Server Configuration':
      ensure => running,
      name   => 'sshd',
      enable => true,
    }

  $cis_ssh_settings.each |$rule, $setting| {
    file_line { "${rule}":
      ensure => present,
      path   => $file,
      line   => $setting,
      notify => Service['(5.2) - Ensure SSH Server Configuration'],
    }
  }

  file { "(6.2.3) - ${file} permissions":
    ensure => file,
    name   => $file,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
    notify => Service['(5.2) - Ensure SSH Server Configuration'],
    }
  }
  else{
    fail("(5.2.1 - 5.2.16) - Configure ssh is out of bounds of the ${modulename} or ${caller_module_name} classes")
  }
} #EOF
