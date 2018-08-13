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
                          'cis_verify_root_path.sh',
                          'cis_user_dot_files_verified.sh',
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
      'chargen-dgram'=> '(2.1.1) - Disable chargen-dgram',
      'chargen-stream'=> '(2.1.1) - Disable chargen-stream',
      'daytime-dgram'=> '(2.1.2) - Disable daytime-dgram',
      'daytime-stream'=> '(2.1.2) - Disable daytime-stream',
      'discard-dgram'=> '(2.1.3) - Disable discard-dgram',
      'discard-stream'=> '(2.1.3) - Disable discard-stream',
      'echo-dgram'=> '(2.1.4) - Disable echo-dgram',
      'echo-stream'=> '(2.1.4) - Disable echo-stream',
      'time-dgram'=> '(2.1.5) - Disable time-dgram',
      'time-stream'=> '(2.1.5) - Disable time-stream',
      'tftp-server'=> '(2.1.6) - disable tftp-server',
      'xinetd'=> '(2.1.7) - disable xinetd',
    }

    # 2.2.1
    $time_service = 'ntp'
    $time_server = ''
    # rule 3.8

        $nfs_services = [
                          'nfslock',
                          'rpcgssd',
                          'rpcbind',
                          'rpcidmapd',
                          'rpcsvcgssd',
                          ]
    # 2.3.1
    $cis_remove_package = {
      'ypbind'=> '(2.3.1) - Ensure NIS Client is not installed (Scored)',
      'rsh'=> '(2.3.2) - Ensure rsh client is not installed (Scored)',
      'talk'=> '(2.3.3) - Ensure talk client is not installed (Scored)',
      'telnet'=> '(2.3.4) - Ensure telnet client is not installed (Scored)',
      'openldap-clients'=> '(2.3.5) - Ensure LDAP client is not installed (Scored)',
    }
    # 3.7
    $cis_wireless_links = []
    #4.1.12
    $cis_audit_partitions=[]
    #4.2.2
    $cis_syslog_ng_server = ''
    $cis_syslog_ng_entries = {
    'options { chain_hostnames(off); flush_lines(0); perm(0640); stats_freq(3600);threaded(yes); };' => '/path/to/file',
  }
    # 5.1.1

        $remotelog_server         = 'mylogserver.my'
        $rsyslog_content= {
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
    #5.2 ssh config
    $cis_manage_ssh = true
    $cis_ssh_settings ={
      '(5.2.2) - Ensure SSH Protocol is set to 2 (Scored)'=>'Protocol 2',
      '5.2.3 Ensure SSH LogLevel is set to INFO (Scored)'=>'LogLevel INFO',
      '5.2.4 Ensure SSH X11 forwarding is disabled (Scored)'=>'X11Forwarding no',
      '5.2.5 Ensure SSH MaxAuthTries is set to 4 or less (Scored)'=>'MaxAuthTries 4',
      '5.2.6 Ensure SSH IgnoreRhosts is enabled (Scored)'=>'IgnoreRhosts yes',
      '5.2.7 Ensure SSH HostbasedAuthentication is disabled (Scored)'=>'HostbasedAuthentication no',
      '5.2.8 Ensure SSH root login is disabled (Scored)'=>'PermitRootLogin no',
      '5.2.9 Ensure SSH PermitEmptyPasswords is disabled (Scored)'=>'PermitEmptyPasswords no',
      '5.2.10 Ensure SSH PermitUserEnvironment is disabled (Scored)'=>'PermitUserEnvironment no',
      '5.2.11 Ensure only approved ciphers are used (Scored)'=>'Ciphers aes256-ctr,aes192-ctr,aes128-ctr',
      '5.2.12 Ensure only approved MAC algorithms are used (Scored)'=>'MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com',
      '5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored), interval'=>'ClientAliveInterval 300',
      '5.2.13 Ensure SSH Idle Timeout Interval is configured (Scored), countmax'=>'ClientAliveCountMax 4',
      '5.2.14 Ensure SSH LoginGraceTime is set to one minute or less (Scored)'=>'LoginGraceTime 60',
      '5.2.16 Ensure SSH warning banner is configured (Scored)'=>'Banner /etc/issue.net',
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

    # 5.5 Ensure root login is restricted to system console (Not Scored)
    $cis_consoles =[]
  }
  else {
    $benchmark = false
    #fail("$facts['operatingsystem'] $facts['os'].['release']} not supported")
    }
} #EOF
