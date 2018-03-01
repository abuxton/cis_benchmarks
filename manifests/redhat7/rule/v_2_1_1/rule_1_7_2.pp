# 1.7.2 Ensure GDM login banner is configured (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_1_7_2 (
  Boolean $manage_gdm             = lookup("${cis_benchmarks::cis_version_base}::manage_gdm"),
  String $gdm_banner_message_text = lookup("${cis_benchmarks::cis_version_base}::gdm_banner_message_text"),
) {

$file = '/etc/dconf/profile/gdm'
$banner_file = '/etc/dconf/db/gdm.d/01-banner-message'
if $manage_gdm{
  package { '(1.7.2) Ensure GDM is installed and confiured':
    ensure => 'installed',
    name   => 'gdm',
  }
  file{ "(1.7.2) - ${file} exists":
    ensure =>  file,
    path   =>  $file,
    owner  =>  'root',
    group  =>  'root',
    mode   =>  '0644',
  }
  file_line { "(1.7.2) ${file} - ensure presence of user-db:user":
    ensure => present,
    path   => $file,
    line   => 'user-db:user',
    notify =>  Exec['(1.7.2) GDM - update dconf'],
  }
  file_line { "(1.7.2) ${file} - ensure presence of system-db:gdm":
    ensure => present,
    path   => $file,
    line   => 'system-db:gdm',
    notify =>  Exec['(1.7.2) GDM - update dconf'],
  }
  file_line { "(1.7.2) ${file} - ensure presence of file-db:/usr/share/gdm/greeter-dconf-defaults":
    ensure => present,
    path   => $file,
    line   => 'file-db:/usr/share/gdm/greeter-dconf-defaults',
    notify =>  Exec['(1.7.2) GDM - update dconf'],
  }
  file{ "(1.7.2) - ${banner_file} exists":
    ensure =>  file,
    path   =>  $banner_file,
    owner  =>  'root',
    group  =>  'root',
    mode   =>  '0644',
  }
  file_line { "(1.7.2) ${banner_file} - ensure presence of [org/gnome/login-screen]":
    ensure => present,
    path   => $banner_file,
    line   => '[org/gnome/login-screen]',
    notify =>  Exec['(1.7.2) GDM - update dconf'],
  }
  file_line { "(1.7.2) ${banner_file} - ensure presence of banner-message-text='<banner message>'":
    ensure => present,
    path   => $banner_file,
    line   => "banner-message-text='${gdm_banner_message_text}'",
    notify =>  Exec['(1.7.2) GDM - update dconf'],
  }
  exec { '(1.7.2) GDM - update dconf':
    command => 'dconf update',
    path    => '/sbin:/bin',
  }
}

} #EOF
