
# 1.1.1.8 Ensure mounting of FAT filesystems is disabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_8{
include ::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq
$file = $::cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_1_prereq::file
file_line { "(1.1.1.8) ${file} - vfat":
  ensure  => present,
  path    => $file,
  line    => 'install vfat /bin/true',
  require => File[$file],
  }

}
