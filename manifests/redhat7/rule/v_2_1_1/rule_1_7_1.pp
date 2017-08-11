# 1.6.2 Ensure SELinux is installed (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_7_1 {
  $banners = lookup("cis_benchmarks::${cis_benchmarks::cis_version}::banners", Array, 'first',$cis_benchmarks::params::banners)
) inherits cis_benchmarks::params {
  #includes Rules:
  # 8.1 - Set Warning Banner for Standard Login Services (Scored)
  # 8.2 - Remove OS Information from Login Warning Banners (Scored)
  $banners.each |$banner| {
  file { "(8.1) - /etc/${banner} exists":
    ensure  => file,
    path    => "/etc/${banner}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source => "puppet://modules/cis_benchmarks/${banner}")
    }
  }
} #EOF
