# 1.7.1 Command Line Warning Banners
# 1.7.1.1 Ensure message of the day is configured properly (Scored)
# 1.7.1.2 Ensure local login warning banner is configured properly (Not Scored)
# 1.7.1.3 Ensure remote login warning banner is configured properly (Not Scored)
# 1.7.1.4 Ensure permissions on /etc/motd are configured (Not Scored)
# 1.7.1.5 Ensure permissions on /etc/issue are configured (Scored)
# 1.7.1.6 Ensure permissions on /etc/issue.net are configured (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_7_1 (
  Array $banners = lookup("${cis_benchmarks::cis_version_base}::banners"),
) {
  #includes Rules:
  # 8.1 - Set Warning Banner for Standard Login Services (Scored)
  # 8.2 - Remove OS Information from Login Warning Banners (Scored)
  $banners.each |$banner| {
  file { "(1.7.1) - /etc/${banner} exists":
    ensure => file,
    path   => "/etc/${banner}",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/cis_benchmarks/etc/${banner}",
    }
  }
} #EOF
