
# 1.1.1.7 Ensure mounting of udf filesystems is disabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_7{
include ::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq::file

  file_line { "(1.1.1.7) ${file} - udf":
    ensure  => present,
    path    => $file,
    line    => 'install udf /bin/true',
    require => File[$file],
  }

}
