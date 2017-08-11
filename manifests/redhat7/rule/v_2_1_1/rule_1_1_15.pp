# 1.1.15 Ensure nodev option set on /dev/shm partition (Scored)
# 1.1.16 Ensure nosuid option set on /dev/shm partition (Scored)
# 1.1.17 Ensure noexec option set on /dev/shm partition (Scored)

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_15 {
  file_line { '(1.1.15) /dev/shm - nodev':
    path  => '/etc/fstab',
    line  => '#<volume>  /dev/shm  <fstype> nodev 0 0',
    #match => '\*/dev/shm\*nodev',
  }

  file_line { '(1.1.16) /dev/shm - nosuid':
    path  => '/etc/fstab',
    line  => '#<volume>  /dev/shm  <fstype> nosuid 0 0',
    #match => '\*/dev/shm\*nosuid',
  }

  file_line { '(1.1.17) /dev/shm - noexec':
    path  =>  '/etc/fstab',
    line  =>  'tmpfs /dev/shm tmpfs noexec 0 0',
    #match => '\*/dev/shm\*noexec',
  }
  ~> exec {'remount /dev/shm':
    path        => ['/bin','/sbin'],
    command     => 'mount -o remount,noexec /dev/shm',
    refreshonly => true,
  }

}#EOF
