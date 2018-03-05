# 6.2.12 Ensure no users have .netrc files (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_12 {

  $netrc = $::cis_benchmarks['netrc']

  if $netrc != ''
  {
      notify  { '(6.2.12) Ensure no users have .netrc files (Scored): FAILED' :
      }
      notify  { "(6.2.13) Ensure users' .netrc Files are not group or world accessible: FAILED" :
      }
  }

} #EOF
