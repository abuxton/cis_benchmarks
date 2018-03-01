# 1.1.1.2 Ensure mounting of freevxfs filesystems is disabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_2{
include ::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq::file
file_line { "(1.1.1.2) ${file} - freevxfs":
  ensure  => present,
  path    => $file,
  line    => 'install freevxfs /bin/true',
  require => File[$file],
  }

}
