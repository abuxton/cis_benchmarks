class mtn_cis::redhat7::rule::v_1_0_0::rule_1_1_18 {

  # includes Rules:
  # 1.1.18 - Disable Mounting of cramfs Filesystems (Not Scored)
  # 1.1.19 - Disable Mounting of freevxfs Filesystems (Not Scored)
  # 1.1.20 - Disable Mounting of jffs2 Filesystems (Not Scored)
  # 1.1.21 - Disable Mounting of hfs Filesystems (Not Scored)
  # 1.1.22 - Disable Mounting of hfsplus Filesystems (Not Scored)
  # 1.1.23 - Disable Mounting of squashfs Filesystems (Not Scored)
  # 1.1.24 - Disable Mounting of udf Filesystems (Not Scored)
  #

  $file = '/etc/modprobe.d/CIS.conf'

  file { '/etc/modprobe.d':
    ensure => directory,
    mode   => '0755',
    owner  => 'root',
    group  => 'root',
  }

  file { $file :
    ensure  => file,
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    require => File['/etc/modprobe.d'],
  }

  file_line { "(1.1.18) ${file} - cramfs":
    ensure  => present,
    path    => $file,
    line    => 'install cramfs /bin/true',
    require => File[$file],
  }

  file_line { "(1.1.19) ${file} - freevxfs":
    ensure  => present,
    path    => $file,
    line    => 'install freevxfs /bin/true',
    require => File[$file],
  }

  file_line { "(1.1.20) ${file} - jffs2":
    ensure  => present,
    path    => $file,
    line    => 'install jffs2 /bin/true',
    require => File[$file],
  }

  file_line { "(1.1.21) ${file} - hfs":
    ensure  => present,
    path    => $file,
    line    => 'install hfs /bin/true',
    require => File[$file],
  }

  file_line { "(1.1.22) ${file} - hfsplus":
    ensure  => present,
    path    => $file,
    line    => 'install hfsplus /bin/true',
    require => File[$file],
  }

  file_line { "(1.1.23) ${file} - squashfs":
    ensure  => present,
    path    => $file,
    line    => 'install squashfs /bin/true',
    require => File[$file],
  }

  file_line { "(1.1.24) ${file} - udf":
    ensure  => present,
    path    => $file,
    line    => 'install udf /bin/true',
    require => File[$file],
  }



} #EOF
