class mtn_cis::redhat7::rule::v_1_0_0::rule_1_4_1 {
  # includes Rules:
  # 1.4.1 - Enable SELinux in /etc/grub.conf (Scored)
  ######E## Modified.  It is /etc/grub2.cfg now
  # 1.4.2 - Set the SELinux State (Scored)
  # 1.4.3 - Set the SELinux Policy (Scored)

  $grubfile = '/etc/grub2.cfg'

  file { $grubfile:
    ensure => file,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }

  file_line { "(1.4.1) ${grubfile} - selinux=0":
    ensure => absent,
    path   => $grubfile,
    line   => 'selinux=0',
  }

  file_line { "(1.4.1) ${grubfile} - enforcing=0":
    ensure => absent,
    path   => $grubfile,
    line   => 'enforcing=0',
  }

  $file = '/etc/selinux/config'
  file { $file :
    ensure => file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file_line { "(1.4.2) ${file} - SELINUX=enforcing":
    ensure => present,
    path   => $file,
    line   => 'SELINUX=enforcing',
  }

  file_line { "(1.4.3) ${file} - SELINUXTYPE=targeted":
    ensure => present,
    path   => $file,
    line   => 'SELINUXTYPE=targeted',
  }

} #EOF
