# 6.2.2 Ensure no legacy "+" entries exist in /etc/passwd (Scored)
# 6.2.3 Ensure no legacy "+" entries exist in /etc/shadow (Scored)
# 6.2.4 Ensure no legacy "+" entries exist in /etc/group (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_2 {

  $passwd = $::cis_benchmarks['legacy_entry_passwd']
  $shadow = $::cis_benchmarks['legacy_entry_shadow']
  $group = $::cis_benchmarks['legacy_entry_group']

  if $passwd != undef and $passwd != ''
  {
      notify { '(6.2.2) Ensure no legacy "+" entries exist in /etc/passwd (Scored) contains a "+" entry': }
  }

  if $shadow != undef and $shadow != ''
  {
      notify { '(6.2.3) Ensure no legacy "+" entries exist in /etc/shadow (Scored) contains a "+" entry': }
  }

  if $group != undef and $group != ''
  {
      notify { '(6.2.4) Ensure no legacy "+" entries exist in /etc/group (Scored) contains a "+" entry': }
  }



} #EOF
