# 6.1 System File Permissions
# 6.1.13 Audit SUID executables (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_13 {

  $files = $::cis_benchmarks['suid_exec']

  if $files != ''
  {
      notify { "(6.1.13) Audit SUID executables (Not Scored), FAILED": }
  }

} #EOF
