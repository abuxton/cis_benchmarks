# 1.1.22 Disable Automounting (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_22 {

  exec{ '1.1.22 - Disable Automounting (Scored)':
    command => 'systemctl disable autofs',
    path    => '/sbin'
    onlyif  => 'test `[ $(systemctl is-enabled autofs) == "enabled" ]',
  }

}#EOFs
