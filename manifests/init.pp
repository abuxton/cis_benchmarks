# class cis_benchmarks
#cis implimentation
#
class cis_benchmarks(
  String $cis_version = lookup('cis_benchmarks::version', String,'first','v_2_1_1'),
  Boolean $benchmark  = lookup('cis_benchmarks::benchmark', Boolean, 'first', $cis_benchmarks::params::benchmark),
  Hash $exec_controls = lookup('cis_benchmarks::exec_control', Hash, 'first', $cis_benchmarks::params::exec_control),
  ) inherits ::cis_benchmarks::params {
$osrelease = $cis_benchmarks::params::osrelease

require ::cis_benchmarks::prereq

$exec_controls.each |$rule, $ishouldexecute| {
  if $ishouldexecute {
    class{ "::cis_benchmarks::${osrelease}::rule::${cis_version}::${rule}":
      }
    }
  }

}#EOF
