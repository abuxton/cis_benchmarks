# 3.5 Uncommon Network Protocols
# 3.5.1 Ensure DCCP is disabled (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_5 {
  $file = '/etc/modprobe.d/CIS.conf'
  include cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_1_1_prereq #creates /etc/modprobe.d
  if !defined{
    file{ $file :
        ensure => file,
        mode   => '0644',
        owner  => root,
        group  => root,
      }
  }
  file_line { "(3.5.1) - ${file}: disable DCCP ":
    ensure => present,
    path   => $file,
    line   => 'install dccp /bin/true',
  }

  file_line { "(3.5.2) - ${file}: disable SCTP ":
    ensure => present,
    path   => $file,
    line   => 'install sctp /bin/true',
  }

  file_line { "(3.5.3) - ${file}: disable RDS ":
    ensure => present,
    path   => $file,
    line   => 'install rds /bin/true',
  }

  file_line { "(3.5.4) - ${file}: disable TIPC ":
    ensure => present,
    path   => $file,
    line   => 'install tipc /bin/true',
  }





} #EOF
