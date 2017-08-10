# replaces mtn_cis::redhat7::rule::v_1_0_0::rule_3_8
#wrong tpe of param for hash usage
class mtn_cis::redhat7::rule::v_1_0_0::rule_3_8 (
  $nfs_services = lookup ('mtn_cis::nfs_services', Array, 'first', $mtn_cis::params::nfs_services),
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
