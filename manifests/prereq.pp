
class cis_benchmarks::prereq (
  $cis_scripts_dir = lookup('cis_benchmarks::cis_scripts_dir', String, 'first', '/tmp/cis_scripts/'),
  $cis_scripts     = lookup('cis_benchmarks::cis_scripts', Array, 'first', $::cis_benchmarks::params::cis_scripts ),
) inherits ::cis_benchmarks::params {

  ### CIS BENCHMARK PREREQUISITE STEPS

  # location for CIS shell scripts

  file { $cis_scripts_dir :
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      noop   => false,
    }


  # place CIS shell script on each node
  each($cis_scripts) |$item| {
    file { "${cis_scripts_dir}/${item}":
      ensure => file,
      source => "puppet:///modules/cis_benchmarks/${item}",
      mode   => '0755',
    }
  }

} #EOF
