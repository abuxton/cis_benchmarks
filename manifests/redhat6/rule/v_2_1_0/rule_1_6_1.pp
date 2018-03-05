# 1.6.1 Configure SELinux
# 1.6.1.1 Ensure SELinux is not disabled in bootloader configuration (Scored)
# 1.6.1.2 Ensure the SELinux state is enforcing (Scored)
# 1.6.1.3 Ensure SELinux policy is configured (Scored)
# 1.6.1.4 Ensure SETroubleshoot is not installed (Scored)

class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_6_1{
  $grubfile = '/etc/grub2.cfg'

  file { $grubfile:
    ensure => file,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }

  file_line { "(1.6.1.1) ${grubfile} - ensure absence of selinux=0":
    ensure => absent,
    path   => $grubfile,
    line   => 'selinux=0',
  }

  file_line { "(1.6.1.1) ${grubfile} - ensure absence of enforcing=0":
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

  file_line { "(1.6.1.2) ${file} - SELINUX=enforcing":
    ensure => present,
    path   => $file,
    line   => 'SELINUX=enforcing',
  }

  file_line { "(1.6.1.3) ${file} - SELINUXTYPE=targeted":
    ensure => present,
    path   => $file,
    line   => 'SELINUXTYPE=targeted',
  }

  package{ '1.6.1.4 Ensure setroubleshoot is removed (Scored)':
    ensure => purged,
    name   => 'setroubleshoot',
  }
} #EOF
