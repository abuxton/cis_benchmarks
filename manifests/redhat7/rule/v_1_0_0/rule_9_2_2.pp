class mtn_cis::redhat7::rule::v_1_0_0::rule_9_2_2 {
  # includes Rules:
  # 9.2.2 - Verify No Legacy "+" Entries Exist in /etc/passwd File (Scored)
  # 9.2.3 - Verify No Legacy "+" Entries Exist in /etc/shadow File (Scored)
  # 9.2.4 - Verify No Legacy "+" Entries Exist in /etc/group File (Scored)

  $passwd = $::cis_benchmarks['legacy_entry_passwd']
  $shadow = $::cis_benchmarks['legacy_entry_shadow']
  $group = $::cis_benchmarks['legacy_entry_group']

  if $passwd != ''
  {
      notify { "(9.2.2) - /etc/passwd contains a '+' entry": }
  }

  if $shadow != ''
  {
      notify { "(9.2.3) - /etc/shadow contains a '+' entry": }
  }

  if $group != ''
  {
      notify { "(9.2.4) - /etc/group contains a '+' entry": }
  }

} #EOF
