# 1.2.5 Disable the rhnsd Daemon (Not Scored)
# APPLIES TO REDHAT only
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_2_5{
  if $::operatingsystem == 'RedHat' {
    service { '(1.2.5) rhnsd service is disabled':
      ensure => stopped,
      name   => 'rhnsd',
      enable => false,
    }
  } else {
      notify { '(1.2.5) - This operating system is not RedHat, skipping rule..': }
  }


  } #EOF
