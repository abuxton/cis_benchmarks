# 1.1.1.3 Ensure mounting of jffs2 filesystems is disabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_3{
include ::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq::file
file_line { "(1.1.1.3) ${file} - jffs2":
  ensure  => present,
  path    => $file,
  line    => 'install jffs2 /bin/true',
  require => File[$file],
  }

}
