class cis_benchmarks::redhat7::rule::v_1_0_0::rule_4_6_1 {
  # includes Rules:
  # 4.6.1 - Disable DCCP (Not Scored)

  $file = '/etc/modprobe.d/CIS.conf'

  file_line { "(4.6.1) - ${file}: disable DCCP ":
    ensure => present,
    path   => $file,
    line   => 'install dccp /bin/true',
  }

  file_line { "(4.6.2) - ${file}: disable SCTP ":
    ensure => present,
    path   => $file,
    line   => 'install sctp /bin/true',
  }

  file_line { "(4.6.3) - ${file}: disable RDS ":
    ensure => present,
    path   => $file,
    line   => 'install rds /bin/true',
  }

  file_line { "(4.6.4) - ${file}: disable TIPC ":
    ensure => present,
    path   => $file,
    line   => 'install tipc /bin/true',
  }



} #EOF
