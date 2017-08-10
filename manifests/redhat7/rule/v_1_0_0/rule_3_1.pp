class mtn_cis::redhat7::rule::v_1_0_0::rule_3_1 {
  # includes Rules:
  # 3.1 - Set Daemon umask (Scored)

  $file = '/etc/sysconfig/init'

  if $::operatingsystem == 'RedHat' {
    file { "(3.1) - ${file} exists":
      ensure => file,
      path   => $file,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
    }

    file_line { "(3.1) - ${file} umask 027":
      ensure => present,
      path   => $file,
      line   => 'umask 027',
      match  => '^umask 027',
    }
  } else {
    notify { '(3.1) - This operating system is not RedHat, skipping..': }
  }


} #EOF
