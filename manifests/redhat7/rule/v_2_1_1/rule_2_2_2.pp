#2.2.2 Ensure X Window System is not installed (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_2 {
package { "(2.2.2) - xorg-x11 removed" :
  ensure => purged,
  name=> 'xorg-x11'
}

} #EOF
