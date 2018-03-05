# 1.4.1 Ensure permissions on bootloader config are configured (Scored)
# 1.4.2 Ensure bootloader password is set (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_4_1 {
  $file = '/boot/grub2/grub.cfg'
if !defined(File[$file]){
    file { "(1.4.1) - ${file} ownership":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }
}
} #EOF
