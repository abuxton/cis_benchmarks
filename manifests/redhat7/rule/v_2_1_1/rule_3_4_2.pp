# 3.4 TCP Wrappers
# 3.4.2 Ensure /etc/hosts.allow is configured (Scored)
# 3.4.3 Ensure /etc/hosts.deny is configured (Scored)
# 3.4.4 Ensure permissions on /etc/hosts.allow are configured (Scored)
# 3.4.5 Ensure permissions on /etc/hosts.deny are configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_3_4_2 {
  File{
    owner => 'root',
    group => 'root',
    mode  => '0644',
    }

file{ '(3.4.2) Ensure /etc/hosts.allow is configured (Scored)':
  ensure  => file,
  path    => '/etc/hosts.allow',
  #no content class should be used to ensure file not configure it.
  }
file{ '(3.4.3) Ensure /etc/hosts.deny is configured (Scored)':
  ensure  => file,
  path    => '/etc/hosts.deny',
    #no content class should be used to ensure file not configure it.
  }


} #EOF
