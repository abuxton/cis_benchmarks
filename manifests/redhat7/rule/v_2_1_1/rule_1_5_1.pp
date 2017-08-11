# 1.5.1  Ensure core dumps are restricted (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_5_1 {
  $file = ['/etc/security/limits.conf',
  if !defined(File[$files]){
    file { "(1.5.1) - ${file} exists":
      ensure => file,
      path   => $file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
  }
  file_line { "(1.5.1) - ${file}: disable core dumps":
    ensure => present,
    path   => $file,
    line   => '* hard core 0',
    notify => Exec['1.5.1 - Disable Automounting (Scored)'],
  }
  exec{ '1.5.1 - Disable Automounting (Scored)':
    command => 'sysctl -w fs.suid_dumpable=0',
    path    => '/sbin:/bin',
    onlyif  => 'test [$(sysctl fs.suid_dumpable) == "fs.suid_dumpable = 0"]',
  }

} #EOF
