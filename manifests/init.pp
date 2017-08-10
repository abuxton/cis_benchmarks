# class mtn_cis
#cis implimentation
#
class mtn_cis(
  String $cis_version = lookup('mtn_cis::version', String,'first','v_2_1_1'),
  Boolean $benchmark  = lookup('mtn_cis::benchmark', Boolean, 'first', $mtn_cis::params::benchmark),
  Hash $exec_control  = lookup('mtn_cis::exec_control', Hash, 'first', $mtn_cis::params::exec_control),
  ) inherits ::mtn_cis::params::$cis_version {

include ::mtn_cis::prereq
$execcontrol.each |$rule, $ishouldexecute| {
  if $ishouldexecute {
    class{ "::mtn_cis::$osrelease::rule::${cis_version}::${rule}":
      require => Class['::mtn_cis::prereq'],
      }
    }
  }

}#EOF
