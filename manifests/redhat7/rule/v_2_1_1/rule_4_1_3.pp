# 4.1.3 Ensure auditing for processes that start prior to auditd is enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_1_3 {
  $file = '/boot/grub2/grub.cfg'
  if !defined(File[$file]){
    file { "(1.4.1) - ${file} ownership":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0400',
    }
  }
  file_line { "(4.1.3) Ensure auditing for processes that start prior to auditd is enabled (Scored)":
    ensure  => present,
    path    => $file,
    line    => 'GRUB_CMDLINE_LINUX = "audit=1"',
    match   => '^GRUB_CMDLINE_LINUX.?=".*audit=1.*$',
    replace => false,
  }

} #EOF
