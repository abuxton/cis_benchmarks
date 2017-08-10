# replaces mtn_cis::redhat7::rule::v_1_0_0::rule_8_1
# wrong tpe of param for hash usage
# benchmark_8_1_banner defaults to false as banners are managed in other modules
class mtn_cis::redhat7::rule::v_1_0_0::rule_8_1  (

  $banners = lookup(cis_profile::banners, Array, 'first',$cis_profile::params::banners)

) {
  #includes Rules:
  # 8.1 - Set Warning Banner for Standard Login Services (Scored)
  # 8.2 - Remove OS Information from Login Warning Banners (Scored)
  $banners.each |$banner| {
    file { "(8.1) - ${banner} exists":
        ensure  => file,
        path    => $banner,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => epp('mtn_cis/banner.epp')
    }
  }

} #EOF
