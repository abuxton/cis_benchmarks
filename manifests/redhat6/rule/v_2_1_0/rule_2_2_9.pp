# 2.2.9 Ensure FTP Server is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_9 {
  service{ '(2.2.9) - Disable FTP Server (Scored)':
    name   =>  'vsftpd',
    enable =>  false,
  }

} #EOF
