# 2.2.11 Ensure IMAP and POP3 server is not enabled (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_11 {
  service{ '(2.2.11) - Disable IMPA and POP3 (Scored)':
    name   => 'dovecot',
    enable => false,
  }

} #EOF
