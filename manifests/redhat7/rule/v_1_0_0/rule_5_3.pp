# replaces mtn_cis::redhat7::rule::v_1_0_0::rule_5_3
#wrong tpe of param for hash usage
class mtn_cis::redhat7::rule::v_1_0_0::rule_5_3 (
  $logs = lookup('cis_profile::logs', Array, 'first',$cis_profile::params::logs ),
) {
  # includes Rules:
  # 5.3 - Configure logrotate (Not Scored)
  $file = '/etc/logrotate.d/syslog'

  file { $file:
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => epp('cis_rhel7/logrotate_syslog.epp',{ logs => $logs }),
  }

} #EOF
