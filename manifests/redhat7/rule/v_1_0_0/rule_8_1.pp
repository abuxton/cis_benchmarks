# replaces cis_benchmarks::redhat7::rule::v_1_0_0::rule_8_1
# wrong tpe of param for hash usage
# benchmark_8_1_banner defaults to false as banners are managed in other modules
class cis_benchmarks::redhat7::rule::v_1_0_0::rule_8_1  (
  Array $banners = lookup("${cis_benchmarks::cis_version_base}::banners"),
) {
  #includes Rules:
  # 8.1 - Set Warning Banner for Standard Login Services (Scored)
  # 8.2 - Remove OS Information from Login Warning Banners (Scored)
  $banners.each |$banner| {
    file { "(8.1) - ${banner} exists":
      ensure =>  file,
      path   =>  "/etc/${banner}",
      owner  =>  'root',
      group  =>  'root',
      mode   =>  '0644',
      source =>  "puppet:///modules/cis_benchmarks/etc/audit/${banner}",
      }
    }
  }

} #EOF
