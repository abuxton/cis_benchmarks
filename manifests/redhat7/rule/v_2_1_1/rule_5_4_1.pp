# 5.4 User Accounts and Environment
# 5.4.1 Set Shadow Password Suite Parameters
# 5.4.1.1 Ensure password expiration is 90 days or less (Scored)
# 5.4.1.2 Ensure minimum days between password changes is 7 or more (Scored)
# 5.4.1.3 Ensure password expiration warning days is 7 or more (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_4_1 {
  $file = '/etc/login.defs'

  file { "(5.4.1) - ${file} exists":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file_line { '(5.4.1.1) - Ensure password expiration is 90 days or less (Scored)':
    ensure  => present,
    path    => $file,
    line    => 'PASS_MAX_DAYS 90',
    match   => '^PASS_MAX_DAYS.*',
    replace => true,
  }

  file_line { '(5.4.1.2) - Ensure minimum days between password changes is 7 or more (Scored)':
    ensure  => present,
    path    => $file,
    line    => 'PASS_MIN_DAYS 7',
    match   => '^PASS_MIN_DAYS',
    replace => true,
  }

  file_line { '(5.4.1.3) - Ensure password expiration warning days is 7 or more (Scored)':
    ensure  => present,
    path    => $file,
    line    => 'PASS_WARN_AGE 7',
    match   => '^PASS_WARN_AGE',
    replace => true,
  }
  exec{'5.4.1.4 Ensure inactive password lock is 30 days or less (Scored)':
      command =>  'useradd -D -f 30',
      path    =>  '/sbin:/bin',
      unless  => "test $(useradd -D | grep INACTIVE)=='INACTIVE=30'!eq'INACTIVE=30' ",
    }

} #EOF
