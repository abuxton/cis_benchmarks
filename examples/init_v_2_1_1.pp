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
  'rule_1_2_2'    => true,
  'rule_1_2_3'    => true,
  'rule_1_2_4'    => true,
  'rule_1_3_1'    => true,
  'rule_1_4_1'    => true,
  'rule_1_4_3'    => true,
  'rule_1_5_1'    => true,
  'rule_1_5_2'    => true, #unrequired on x86_64
  'rule_1_5_3'    => true,
  'rule_1_5_4'    => true,
  'rule_1_6_1'    => true,
  'rule_1_6_1_5'  => true,
  'rule_1_6_1_6'  => true,
  'rule_1_6_2'    => true,
  'rule_1_7_1'    => true,
  'rule_1_7_2'    => true,
  'rule_1_8'      => false, #fail invoked yum update do not use
  'rule_2_1'      => true,
  'rule_2_2_1'    => true, #needs to know time server and time management package if used
  'rule_2_2_2'    => true,
  'rule_2_2_3'    => true,
  'rule_2_2_4'    => true,
  'rule_2_2_5'    => true,
  'rule_2_2_6'    => true,
  'rule_2_2_7'    => true,
  'rule_2_2_8'    => true,
  'rule_2_2_9'    => true,
  'rule_2_2_10'   => true,
  'rule_2_2_11'   => true,
  'rule_2_2_12'   => true,
  'rule_2_2_13'   => true,
  'rule_2_2_4'    => true,
  'rule_specialperms'=> false,
}
class{ '::cis_benchmarks':
  cis_version   => 'v_2_1_1',
  exec_controls => $exec_controls,
}
