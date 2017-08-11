# 1.5.3 Ensure address space layout randomization (ASLR) is enabled
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_5_3 {
  $file = '/etc/sysctl.conf'
  if !defined(File[$files]){
    file { "(1.5.1) - ${file} exists":
      ensure => file,
      path   => $file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  file_line { "(1.5.3) - ${file_sysctl}: enable ASLR":
    ensure => present,
    path   => $file,
    line   => 'kernel.randomize_va_space = 2',
    match  => '^kernel.randomize_va_space',
  }

  } #EOF
