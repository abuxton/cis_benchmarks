#1.1.1.4 Ensure mounting of hfs filesystems is disabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_4{
include ::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq::file
file_line { "(1.1.1.4) ${file} - hfs":
  ensure  => present,
  path    => $file,
  line    => 'install hfs /bin/true',
  require => File[$file],
  }

}
