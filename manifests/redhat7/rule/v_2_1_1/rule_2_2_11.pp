# 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_11 {
  exec{ '2.2.11 - Disable IMPA and POP3 (Scored)':
    command => 'systemctl disable dovecot',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled dovecot) == "enabled"]',
  }

} #EOF
