# 1.2.3 Ensure gpgcheck is globally activated (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_2_3 {

  if $::operatingsystem == 'RedHat'
  {
    $gpgkey = $::cis_benchmarks['redhat_gpg']
    if $gpgkey == 'RedHat GPG Key is not installed' {
      notify { '(1.2.3) - RedHat GPG Key is not installed': }
    }
  } else {
    notify { '(1.2.3) - This operating system is not RedHat, skipping rule..': }
  }

}#EOF
