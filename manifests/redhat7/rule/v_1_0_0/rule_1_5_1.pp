# replaces mtn_cis::redhat7::rule::v_1_0_0::rule_1_5_1
#wrong tpe of param for hash usage
#class is not paramatized to avoid password in plain text module
class mtn_cis::redhat7::rule::v_1_0_0::rule_1_5_1{
  $file = '/boot/grub2/grub.cfg'
  $sourcefile = '/etc/grub.d/40_custom'
  $grubpwd = lookup('cis_profile::grubpwd', String, 'first', $cis_profile::params::grubpwd)
    file { "(1.5.1 - 1.5.2) - ${file} ownership":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0400',
  }

  file_line { "(1.5.3) - set superusers in ${file}":
    ensure => present,
    path   => $sourcefile,
    line   => 'set superusers="root"',
  }

  file_line { "(1.5.3) - set password in ${file}":
    ensure => present,
    path   => $sourcefile,
    line   => $grubpwd,
  }

  exec { 'updategrub':
    command     => "/sbin/grub2-mkconfig -o ${file} && /bin/chmod 0400 ${file}",
    refreshonly => true,
    subscribe   => [ File_line["(1.5.3) - set password in ${file}"], File_line["(1.5.3) - set superusers in ${file}"]],
  }
}
