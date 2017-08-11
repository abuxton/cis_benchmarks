# example of running with alternative version
# alternative decleration
# $exec_controls = {}
# class{ '::cis_benchmarks':
#   cis_version   => 'v_2_1_1',
#   exec_controls => $exec_controls,
# }
#
# All rules included for comment

$exec_controls = {
  'rule_1_1_1_1'  => false,
  'rule_1_1_1_2'  => false,
  'rule_1_1_1_3'  => true,
  'rule_1_1_1_4'  => true,
  'rule_1_1_1_5'  => true,
  'rule_1_1_1_6'  => true,
  'rule_1_1_1_7'  => true,
  'rule_1_1_1_8'  => true,
  'rule_1_1_2'    => true,
  'rule_1_1_6'    => true,
  'rule_1_1_11'   => true,
  'rule_1_1_13'   => true,
  'rule_1_1_15'   => true,
  'rule_1_1_18'   => true,
  'rule_1_1_21'   => true,
  'rule_1_1_22'   => true,
  'rule_1_2_2'   => true,

  'rule_specialperms'=> false,
}
class{ '::cis_benchmarks':
  cis_version   => 'v_2_1_1',
  exec_controls => $exec_controls,
}
