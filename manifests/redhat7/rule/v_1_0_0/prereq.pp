class mtn_cis::redhat7::rule::v_1_0_0::prereq (
  $cis_scripts_dir = lookup('cis_profile::cis_scripts_dir', String, 'first', '/tmp/cis_scripts/'),
  $cis_scripts     = lookup('cis_profile::cis_scripts', Array, 'first' , $cis_profile::params::cis_scripts),
) {

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
      source => "puppet:///modules/cis_rhel7/${item}",
      mode   => '0755',
    }
  }

} #EOF
