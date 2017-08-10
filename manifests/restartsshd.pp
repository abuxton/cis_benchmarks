class cis_benchmarks::restartsshd {
  exec { 'restart ssh daemon':
    path        => ['/sbin','/bin'],
    command     => 'systemctl restart sshd',
    refreshonly => true,
  }
} #EOF
