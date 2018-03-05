# 1.4.3 Ensure authentication required for single user mode (Not Scored)

class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_4_3 {
  $files = ['/usr/lib/systemd/system/emergency.service',
            '/usr/lib/systemd/system/rescue.service',
            ]
  $files.each |$file| {
    file_line { "(1.4.3) - set /sbin/sulogin in ${file}":
      ensure => present,
      path   => $file,
      line   => 'ExecStart=-/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"',
    }
  }
} #EOF
