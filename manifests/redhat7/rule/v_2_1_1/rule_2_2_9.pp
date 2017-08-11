# 2.2.9 Ensure FTP Server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_9 {
  exec{ '2.2.9 - Disable FTP Server (Scored)':
    command => 'systemctl disable vsftpd',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled vsftpd) == "enabled"]',
  }


} #EOF
