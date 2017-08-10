class mtn_cis::redhat7::rule::v_1_0_0::rule_1_1_14 {

  # includes Rules:
  # 1.1.14, 1.1.15, 1.1.16

  file_line { '(1.1.14) /dev/shm - nodev':
    path  => '/etc/fstab',
    line  => '#<volume>  /dev/shm  <fstype> nodev 0 0',
    #match => '\*/dev/shm\*nodev',
  }

  file_line { '(1.1.15) /dev/shm - nosuid':
    path  => '/etc/fstab',
    line  => '#<volume>  /dev/shm  <fstype> nosuid 0 0',
    #match => '\*/dev/shm\*nosuid',
  }

  file_line { '(1.1.16) /dev/shm - noexec':
    path  => '/etc/fstab',
    line  => 'tmpfs /dev/shm tmpfs noexec 0 0',
    #match => '\*/dev/shm\*noexec',
  }
  ~> exec {'remount /dev/shm':
    path        => ['/bin','/sbin'],
    command     => 'mount -o remount,noexec /dev/shm',
    refreshonly => true,
  }

} #EOF
