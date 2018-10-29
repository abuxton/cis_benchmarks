# 1.1.8 Ensure nodev option set on removable media partitions (Not Scored)
# 1.1.19 Ensure nosuid option set on removable media partitions (Not Scored)
# 1.1.20 Ensure noexec option set on removable media partitions (Not Scored)

class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_18 (
  Array $cis_removable_media = lookup("${cis_benchmarks::cis_version_base}::cis_removable_media"),
) {

    $cis_removable_media.each |$media| {
      mount { "(1.1.8) ${media} is mounted nodev":
        ensure  => 'mounted',
        name    => '/$media',
        device  => '/$media',
        fstype  => 'tmpfs',
        options => 'nodev,nosuid,noexec',
    }

  }


}#EOF
