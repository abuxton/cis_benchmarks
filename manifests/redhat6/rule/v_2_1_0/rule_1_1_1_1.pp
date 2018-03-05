# 1.1.1.1 Ensure mounting of cramfs filesystems is disabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_1{
include ::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq::file
file_line { "(1.1.1.1) ${file} - cramfs":
  ensure  => present,
  path    => $file,
  line    => 'install cramfs /bin/true',
  require => File[$file],
  }

}
