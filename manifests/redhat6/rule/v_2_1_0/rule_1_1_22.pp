# 1.1.22 Disable Automounting (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_1_22 {

  exec{ '1.1.22 - Disable Automounting (Scored)':
    command => 'systemctl disable autofs',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled autofs) == "enabled"]',
  }

}#EOFs
