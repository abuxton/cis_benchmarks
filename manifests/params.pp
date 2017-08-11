# == Class cis_benchmarks::params
#
# This class is meant to be called from cis_benchmarks.
# It sets variables according to platform.
#
class cis_benchmarks::params{
# to support folder structure
$osfamily = downcase($facts['os']['family'])
$osreleasemajor = $facts['os']['release']['major']
$osrelease = "${::cis_benchmarks::params::osfamily}${osreleasemajor}"

  if $osrelease == 'redhat7' {
          $benchmark = true #
          $exec_controls = {}
          $cis_scripts =[
                          'cis_ww_files.sh',
                          'cis_ww_dirs.sh',
                          'cis_yumupdates.sh',
                          'cis_unconfined_daemons.sh',
                          'cis_redhat_network.sh',
                          'cis_redhat_gpg.sh',
                          'cis_pkg_integrity.sh',
                          'cis_disable_sys_acct.sh',
                          'cis_unowned_files.sh',
                          'cis_ungrouped_files.sh',
                          'cis_suid_exec.sh',
                          'cis_sgid_exec.sh',
                          'cis_password_fields.sh',
                          'cis_legacy_entry.sh',
                          'cis_uid_0.sh',
                          'cis_dup_uid.sh',
                          'cis_dup_gid.sh',
                          'cis_dup_name.sh',
                          'cis_dup_group.sh',
                          'cis_res_uid.sh',
                          'cis_netrc.sh',
                          'cis_userhome.sh',
                          'cis_validhome.sh',
                          'cis_checkgroup.sh',
                          ]
    # Rule 1.1.8 #array of removable media to set nodev
    $cis_removable_media =[]
    #
    $cis_aide_hour = '5'

    # Rule 1.5.1
    # The default password with the hash below is abcd1234
    # You probably should re-generate and edit this hash using /usr/bin/grub2-mkpasswd-pbkdf2 command
    # NOTE: /usr/bin/grub2-mkpasswd-pbkdf2 command is part of the grub2-tools RPM package on RHEL 7

        $grubpwd = 'password_pbkdf2 root grub.pbkdf2.sha512.10000.9218D397421145AC7721CB920B48CF0B1F435052D4CAA3AD838DB8C6E89ADAB8E5A4CA493608A6307D69877163668690158CAF8421F6411E0F720DC711C111C9.605342B230DA20A2761831CA8C2EA2E645F183CF4EA8A7E65FFCA686E53955380F26E948DA66F063FB00051B8ACDECB1D38F00E4595CB915FF12049F78FB1E3A'
    # Rule 1.7.1
        $banners =[
          'motd',
          'issue',
          'issue.net',
          ]
    # 1.7.2 GDM
    $manage_gdm = false
    $gdm_banner_message_text = ''
    # 2.1 inetd services to disbale
    $cis_inetd_services ={
      'chargen-dgram'=> '(2.1.1) - Disable chargen-dgram'
      'chargen-stream'=> '(2.1.1) - Disable chargen-stream'
      'daytime-dgram'=> '(2.1.2) - Disable daytime-dgram'
      'daytime-stream'=> '(2.1.2) - Disable daytime-stream'
      'discard-dgram'=> '(2.1.3) - Disable discard-dgram'
      'discard-stream'=> '(2.1.3) - Disable discard-stream'
      'echo-dgram'=> '(2.1.4) - Disable echo-dgram'
      'echo-stream'=> '(2.1.4) - Disable echo-stream'
      'time-dgram'=> '(2.1.5) - Disable time-dgram'
      'time-stream'=> '(2.1.5) - Disable time-stream'
      'tftp-server'=> '(2.1.6) - disable tftp-server'
      'tftp-server'=> '(2.1.7) - disable xinetd'
    }
    # rule 3.8

        $nfs_services = [
                          'nfslock',
                          'rpcgssd',
                          'rpcbind',
                          'rpcidmapd',
                          'rpcsvcgssd',
                          ]
    # 5.1.1

        $remotelogserver         = 'mylogserver.my'
        $rsyslogcontent= {
                          '*.info,mail.none,authpriv.none,cron.none,auth,user.*' => '/var/log/messages',
                          'authpriv.*' => '/var/log/secure',
                          'mail.*' => '-/var/log/maillog',
                          'kern.*' => '/var/log/kern.log',
                          'cron.*'=> '/var/log/cron',
                          'uucpnews.crit' => '/var/log/spooler',
                          'local7.*' => '/var/log/boot.log',
                          'daemon.*'=> '/var/log/daemon.log',
                          'syslog.*' => '/var/log/syslog',
                          'lpr,news,uucp,local0,local1,local2,local3,local4,local5,local6.*'=> '/var/log/unused.log',
                        }
    # 5.3 - Configure logrotate (Not Scored)

        $logs = [
                  '/var/log/messages',
                  '/var/log/secure',
                  '/var/log/maillog',
                  '/var/log/spooler',
                  '/var/log/boot.log',
                  '/var/log/cron',
                  ]

  }
  else {
    $benchmark = false
    #fail("$facts['operatingsystem'] $facts['os'].['release']} not supported")
    }
} #EOF
