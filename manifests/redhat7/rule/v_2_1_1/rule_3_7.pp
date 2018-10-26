# 3.7 Ensure wireless interfaces are disabled (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_7 (
  Array $cis_wireless_links = lookup("${cis_benchmarks::cis_version_base}::cis_wireless_links"),
) {

    $cis_wireless_links.each |$interface| {
      exec { "(3.7) ip link set ${interface} down":
        command => "ip link set ${interface} down",
        path    => '/sbin:/bin',
    }
  }

} #EOF
