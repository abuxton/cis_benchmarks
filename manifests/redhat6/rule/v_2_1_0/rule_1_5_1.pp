# 1.5.1  Ensure core dumps are restricted (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_5_1 {
  $file = '/etc/security/limits.conf'
  if !defined(File[$file]){
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
    notify => Sysctl['(1.5.1) - Disable Automounting (Scored)'],
  }

  sysctl { '(1.5.1) - Disable Automounting (Scored)':
  ensure => present,
  name   => 'fs.suid_dumpable',
  value  => '0',
}

} #EOF
