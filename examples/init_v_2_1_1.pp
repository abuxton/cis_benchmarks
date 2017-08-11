# example of running with alternative version
# alternative decleration
# $exec_controls = {}
# class{ '::cis_benchmarks':
#   cis_version   => 'v_1_0_0',
#   exec_controls => $exec_controls,
# }
#
# All rules included for comment

$exec_controls = {
  'rule_1_1_1_1'  => true,

  'rule_specialperms'=> false,
}
class{ '::cis_benchmarks':
  cis_version   => 'v_2_1_1',
  exec_controls => $exec_controls,
}
