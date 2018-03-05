# 5.3 Configure PAM
# 5.3.2 Ensure lockout for failed password attempts is configured (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_5_3 {
  $password_file='/etc/pam.d/password-auth'
  $system_file='/etc/pam.d/system-auth'
  $quality_file='/etc/security/pwquality.conf'
  $quality_settings =[
                      'minlen=14',
                      'dcredit=-1',
                      'ucredit=-1',
                      'ocredit=-1',
                      'lcredit=-1',
                      ]
  file_line{"(5.3.1) - Ensure password creation requirements are configured (Scored), ${password_file}":
    ensure => present,
    path   => $password_file,
    line   => 'password requisite pam_pwquality.so try_first_pass retry=3',
    }
  file_line{"(5.3.1) - Ensure password creation requirements are configured (Scored), ${system_file}":
    ensure => present,
    path   => $system_file,
    line   => 'password requisite pam_pwquality.so try_first_pass retry=3',
    }
$quality_settings.each |$setting| {
  file_line{"(5.3.1) - Ensure password creation requirements are configured (Scored), ${quality_file}, ${setting}":
    ensure => present,
    path   => $quality_file,
    line   => $setting,
    }
  }
  file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${password_file}required":
    ensure => present,
    path   => $password_file,
    line   => 'auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900',
    }
  file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${system_file} required":
    ensure => present,
    path   => $system_file,
    line   => 'auth required pam_faillock.so preauth audit silent deny=5 unlock_time=900',
    }
    file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${password_file} pam":
      ensure => present,
      path   => $password_file,
      line   => 'auth [success=1 default=bad] pam_unix.so',
      }
    file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${system_file} pam":
      ensure => present,
      path   => $system_file,
      line   => 'auth [success=1 default=bad] pam_unix.so',
      }
    file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${password_file} default":
      ensure => present,
      path   => $password_file,
      line   => 'auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900',
      }
    file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${system_file} default":
      ensure => present,
      path   => $system_file,
      line   => 'auth [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900',
      }
    file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${password_file} sufficient":
      ensure => present,
      path   => $password_file,
      line   => 'auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900',
      }
    file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${system_file} sufficient":
      ensure => present,
      path   => $system_file,
      line   => 'auth sufficient pam_faillock.so authsucc audit deny=5 unlock_time=900',
      }

file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${password_file} sufficient remember":
  ensure => present,
  path   => $password_file,
  line   => 'password sufficient pam_unix.so remember=5',
  }
file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${system_file} sufficient remember":
  ensure => present,
  path   => $system_file,
  line   => 'password sufficient pam_unix.so remember=5',
  }
  file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${password_file} sha":
    ensure => present,
    path   => $password_file,
    line   => 'password sufficient pam_unix.so sha512',
    }
  file_line{"(5.3.2) - Ensure lockout for failed password attempts is configured (Scored), ${system_file} sha":
    ensure => present,
    path   => $system_file,
    line   => 'password sufficient pam_unix.so sha512',
    }

} #EOF
