# 2.2.7 Ensure NFS and RPC are not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_7 {
  exec{ '2.2.7 - Disable nfs (Scored)':
    command => 'systemctl disable nfs',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled nfs) == "enabled"]',
  }
  exec{ '2.2.7 - Disable rpcbind (Scored)':
    command => 'systemctl disable rpcbind',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled rpcbind) == "enabled"]',
  }

} #EOF
