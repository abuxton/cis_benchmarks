# replaces cis_benchmarks::redhat7::rule::v_1_0_0::rule_3_8
#wrong tpe of param for hash usage
class cis_benchmarks::redhat7::rule::v_1_0_0::rule_3_8 (
  $nfs_services = lookup ('cis_benchmarks::nfs_services', Array, 'first', $cis_benchmarks::params::nfs_services),
) {

  # includes Rules:
  # 3.8 - Disable NFS and RPC (Not Scored)

  $nfs_services.each |$service| {
    service {"(3.8) - ${service} disabled":
      ensure => stopped,
      name   => $service,
      enable => false,
    }
  }

} #EOF
