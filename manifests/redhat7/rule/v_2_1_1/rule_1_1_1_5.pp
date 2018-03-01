# 1.1.1.5 Ensure mounting of hfsplus filesystems is disabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_5{
include ::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq::file
file_line { "(1.1.1.5) ${file} - hfsplus":
  ensure  => present,
  path    => $file,
  line    => 'install hfsplus /bin/true',
  require => File[$file],
  }

}
