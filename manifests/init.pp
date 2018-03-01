# class cis_benchmarks
#cis implimentation
#
class cis_benchmarks(
  String $version         = 'v_2_1_1',
  Boolean $benchmark      = false,
  Hash $exec_controls     = {},
  String $osrelease_path  = 'unsupported',
  Array $cis_scripts      = [],
  String $cis_scripts_dir = undef,
) {
  include ::stdlib

  # Stop if no os/platform support is available.
  unless $benchmark == true {
    fail("${facts['os']['name']} ${facts['os']['release']['major']} not supported yet")
  }

  # variable exposed for rules to use (to allow refactoring)
  $cis_version_base = "cis_benchmarks::${version}"

  # Determine script dir to use
  if( $cis_scripts_dir ) {
    assert_type(Stdlib::Absolutepath, $cis_scripts_dir)
    $scripts_dir = $cis_scripts_dir
  }
  else {
    # Fallback to script directory per cis_version of rules
    $scripts_dir = lookup("${cis_version_base}::cis_scripts_dir", Stdlib::Absolutepath, 'first', '/tmp/cis_scripts/')
  }

  # location for CIS shell scripts
  file { $scripts_dir:
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    noop   => false,
  }

  # place CIS shell scripts in script directory
  $cis_scripts.each |$item| {
    file { "${scripts_dir}/${item}":
      ensure => file,
      source => "puppet:///modules/cis_benchmarks/${item}",
      mode   => '0755',
    }
  }

  # Iterate over each rule in the hash
  $exec_controls.each |$rule, $ishouldexecute| {
    if $ishouldexecute {
      include "::cis_benchmarks::${osrelease_path}::rule::${version}::${rule}"
    }
  }
}#EOF
