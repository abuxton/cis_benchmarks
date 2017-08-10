class cis_benchmarks::redhat7::rule::v_1_0_0::rule_1_2_2 {
  # includes Rules:
  # 1.2.2 - Verify Red Hat GPG Key is Installed (Scored)

  ## APPLIES TO REDHAT only

  if $::operatingsystem == 'RedHat'
  {
    $gpgkey = $::cis_benchmarks['redhat_gpg']
    if $gpgkey == 'RedHat GPG Key is not installed' {
      notify { '(1.2.2) - RedHat GPG Key is not installed': }
    }
  } else {
    notify { '(1.2.2) - This operating system is not RedHat, skipping rule..': }
  }
} #EOF
