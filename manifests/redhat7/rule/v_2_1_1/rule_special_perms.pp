#
class cis_benchmarks::v2_1_1::special_perms (
  $files = lookup({'name' => 'cis_benchmarks::specialperms', 'default_value' =>{}, 'merge' => { 'strategy' => 'deep', 'merge_hash_arrays' => true}})
){

  $files.each |$myfile, $myperm| {
    file { $myfile:
      ensure => present,
      mode   => $myperm,
    }
    file_line {"add ${myfile} to rc.local":
      ensure => present,
      line   => "chmod ${myperm} ${myfile}",
      path   => '/etc/rc.local',
    }
  }

  # add commands in /etc/rc.local to enforce perms on reboot
  file_line {'rc.local1':
    ensure => present,
    path   => '/etc/rc.local',
    line   => 'chmod 600 /var/log/dmesg* /var/log/boot.log /var/log/lastlog',
  }
  file_line { 'rc.local2':
    ensure => present,
    path   => '/etc/rc.local',
    line   => '/bin/test -f /var/log/wpa_supplicant.log && /bin/chmod 600 /var/log/wpa_supplicant.log',
  }
  file_line { 'rc.local3':
    ensure => present,
    path   => '/etc/rc.local',
    line   => '/bin/test - f /var/log/install-rhui-rpm.log && /bin/chmod 600 /var/log/install-rhui-rpm.log',
  }
  file_line { 'rc.local4':
    ensure => present,
    path   => '/etc/rc.local',
    line   => '/bin/test -f /var/log/up2date && /bin/chmod 600 /var/log/up2date',
  }
  file_line { 'rc.local5':
    ensure => present,
    path   => '/etc/rc.local',
    line   => '/bin/test -f /var/log/waagent.log && /bin/chmod 600 /var/log/waagent.log',
  }

  # Change /var/log/wtmp default perm in /usr/lib/tmpfiles.d/var.conf
  file_line { 'change setting in /usr/lib/tmpfiles.d/var.conf':
    ensure => present,
    path   => '/usr/lib/tmpfiles.d/var.conf',
    line   => 'f /var/log/wtmp 0600 root utmp -',
    match  => 'f /var/log/wtmp 0664 root utmp -',
  }

  file {'securepermcronjob':
    ensure  => present,
    path    => '/etc/cron.hourly/secureperm.sh',
    owner   => root,
    group   => root,
    mode    => '0755',
    content => epp('cis_benchmarks/secureperm.sh.epp'),
  }
  ~> exec {'Execute secureperm script':
    command     => '/etc/cron.hourly/secureperm.sh',
    refreshonly => true,
  }

} #EOF
