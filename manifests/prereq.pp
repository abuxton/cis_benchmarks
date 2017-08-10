
class mtn_cis::prereq (
  $cis_scripts_dir = lookup('mtn_cis::cis_scripts_dir', String, 'first', '/tmp/cis_scripts/'),
  $cis_scripts     = lookup('mtn_cis::cis_scripts', Array, 'first' , $mtn_cis::params::cis_scripts),
) inherits ::mtn_cis::params {

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
      source => "puppet:///modules/mtn_cis/${item}",
      mode   => '0755',
    }
  }

} #EOF
