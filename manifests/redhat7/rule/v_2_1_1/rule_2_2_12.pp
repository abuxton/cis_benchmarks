# 2.2.12 Ensure Samba is not enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_12 {
  exec{ '2.2.12 - Disable samba (Scored)':
    command => 'systemctl disable dovecot',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(systemctl is-enabled smb) == "enabled"]',
  }

} #EOF
