# 1.8 Ensure updates, patches, and additional security software are installed (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_8 {
  $updates = $::cis_benchmarks['yum_updates']

  if $updates == 'yum updates are available'
  {
    notify { '(1.8) - Yum updates are available for this host': }
  }
} #EOF
