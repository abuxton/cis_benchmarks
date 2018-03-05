# 2.2.7 Ensure NFS and RPC are not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_7 {
  service{ '(2.2.7) - Disable nfs (Scored)':
    name   =>  'nfs',
    enable =>  false,
  }
  service{ '(2.2.7) - Disable rpcbind (Scored)':
    name   =>  'rpcbind',
    enable =>  false,
  }

} #EOF
