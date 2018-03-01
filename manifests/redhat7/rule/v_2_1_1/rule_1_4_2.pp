# 1.4.2 Ensure bootloader password is set (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_4_2 (
  String $grubpwd = lookup("${cis_benchmarks::cis_version_base}::grubpwd"),
) {
  $file = '/boot/grub2/grub.cfg'
  $sourcefile = '/etc/grub.d/40_custom'

if !defined(File[$file]){
    file { "(1.4.1) - ${file} ownership":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
}

  file_line { "(1.4.2) - set superusers in ${file}":
    ensure => present,
    path   => $sourcefile,
    line   => 'set superusers="root"',
  }

  file_line { "(1.4.2) - set password in ${file}":
    ensure => present,
    path   => $sourcefile,
    line   => $grubpwd,
  }

  exec { 'updategrub':
    command     => "/sbin/grub2-mkconfig -o ${file} && /bin/chmod 0400 ${file}",
    refreshonly => true,
    subscribe   => [ File_line["(1.4.2) - set password in ${file}"], File_line["(1.4.2) - set superusers in ${file}"]],
  }
} #EOF
