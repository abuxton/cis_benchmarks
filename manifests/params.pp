#
class mtn_cis::params{
# to support folder structure
$osfamily = downcase($facts['os']['family'])
$osrelease = "${mtn_cis::params::osfamily}$facts[os][release][major]"
  if $osrelease != 'redhat7' {

  }
  else {
    $benchmark = false
    #fail("$facts['operatingsystem'] $facts['os'].['release']} not supported")
    }
}
