# 1.1.1.6 Ensure mounting of squashfs filesystems is disabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_6{
include ::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq::file
file_line { "(1.1.1.6) ${file} - squashfs":
  ensure  => present,
  path    => $file,
  line    => 'install squashfs /bin/true',
  require => File[$file],
  }

}
