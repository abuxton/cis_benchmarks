# class cis_benchmarks
#cis implimentation
#
class cis_benchmarks(
  String $cis_version     = lookup('cis_benchmarks::version', String,'first','v_2_1_1'),
  Boolean $benchmark      = lookup('cis_benchmarks::benchmark', Boolean, 'first', $cis_benchmarks::params::benchmark),
  Hash $exec_controls     = lookup("cis_benchmarks::${cis_version}::exec_controls", Hash, 'first', $cis_benchmarks::params::exec_controls),
  Optional[String] $cis_scripts_dir = undef,
  Optional[Array] $cis_scripts  = undef,
  ) inherits ::cis_benchmarks::params {

$osrelease = $cis_benchmarks::params::osrelease

  case $::osfamily {

  redhat: {

    class { '::cis_benchmarks::prereq' :
      cis_scripts_dir => $cis_scripts_dir,
      cis_scripts     =>  $cis_scripts,
      }

    $exec_controls.each |$rule, $ishouldexecute| {
      if $ishouldexecute {
        notice("loading rule ${rule}")
        class{ "::cis_benchmarks::${osrelease}::rule::${cis_version}::${rule}":
          }
        }
      }
    }

  default: {fail("cis_benchmarks is not supported on ${::osfamily}")}
  }
}
#EOF
