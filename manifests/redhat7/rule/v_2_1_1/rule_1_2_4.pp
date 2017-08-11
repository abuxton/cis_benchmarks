# 1.2.4 Ensure Red Hat Network or Subscription Manager connection is configured (Not Scored)
# APPLIES TO REDHAT only
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_2_4{
  if $::operatingsystem == 'RedHat'
    {

      $redhat_network = $::cis_benchmarks['redhat_network']

      if $redhat_network == 'not registered with RHN'
      {
        notify { '(1.2.4) - RedHat Repository is not configured': }
      }
    }
    else
    {
      notify { '(1.2.4) - This operating system is not RedHat, skipping rule..': }
    }


  } #EOF
