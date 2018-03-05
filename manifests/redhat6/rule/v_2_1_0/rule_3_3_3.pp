# 3.3 IPv6
# 3.3.3 Ensure IPv6 is disabled (Not Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_3_3_3 {
$file = '/etc/modprobe.d/CIS.conf'
include ::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq #creates /etc/modprobe.d

    file_line { '(3.3.3) - Ensure IPv6 is disabled (Not Scored)':
      ensure => present,
      path   => $file,
      line   => 'options ipv6 disable=1',
      match  => '^options ipv6 disable',
      }


} #EOF
