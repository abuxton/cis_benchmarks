# 2.1 inetd Services
# 2.1.1 Ensure chargen services are not enabled (Scored)
# 2.1.2 Ensure daytime services are not enabled (Scored)
# 2.1.3 Ensure discard services are not enabled (Scored)
# 2.1.4 Ensure echo services are not enabled (Scored)
# 2.1.5 Ensure time services are not enabled (Scored)
# 2.1.6 Ensure tftp server is not enabled (Scored)
# 2.1.7 Ensure xinetd is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_1 (
  Hash $cis_inetd_services = lookup("${cis_benchmarks::cis_version_base}::cis_inetd_services"),
) {
    $cis_inetd_services.each |$service, $desc| {
      service { $desc :
        ensure => stopped,
        enable => false,
        name   => $service,
      }
    }

} #EOF
