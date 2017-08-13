# 5.1 Configure cron
# 5.1.1 Ensure cron daemon is enabled (Scored)
# 5.1.2 Ensure permissions on /etc/crontab are configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_1 {
service {'{5.1.1} - Ensure cron daemon is enabled (Scored)':
    ensure  => running,
    enable  => true,
  }
$cron_files = {
  '/etc/crontab' => '(5.1.2) - Ensure permissions on /etc/crontab are configured (Scored)',
  '/etc/cronhourly' => '(5.1.3) - Ensure permissions on /etc/cron.hourly are configured (Scored)',
  '/etc/cron.daily' => '(5.1.4) - Ensure permissions on /etc/cron.daily are configured (Scored)',
  '/etc/cron.weekly' => '(5.1.5) - Ensure permissions on /etc/cron.weekly are configured (Scored)',
  '/etc/cron.monthly' => '(5.1.6) - Ensure permissions on /etc/cron.monthly are configured (Scored)',
  '/etc/cron.d' => '(5.1.7) - Ensure permissions on /etc/cron.d are configured (Scored)',
  '/etc/cron.allow'=>'(5.1.8) - Ensure at/cron is restricted to authorized users (Scored), corn.allow',
  '/etc/at.allow'=>'(5.1.8) - Ensure at/cron is restricted to authorized users (Scored), at.allow',
  }
$cron_files.each |$file, $benchmark| {
  file { $benchmark:
    ensure => file,
    path   => $file,
    group  => 'root',
    owner  => 'root',
    mode   => '0600',
    }
  }
  #/etc/cron.deny and /etc/at.deny
  file {'(5.1.8) - Ensure at/cron is restricted to authorized users (Scored), cron.deny':
    ensure => absent,
    path   => '/etc/cron.deny',
    }
  file{ '(5.1.8) - Ensure at/cron is restricted to authorized users (Scored), at.deny':
    ensure => absent,
    path   => '/etc/at.deny',
    }

} #EOF
