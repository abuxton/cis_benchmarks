# 6.2.14 Ensure no users have .rhosts files (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_14 {

  $netrc = $::cis_benchmarks['user_rhosts']

  if $netrc != ''
  {
      notify  { "(6.2.14) - Ensure no users have .rhosts files (Scored): FAILED: ${netrc}"  :
      }
    }


} #EOF
