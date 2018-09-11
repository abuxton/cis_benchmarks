# 4.1 Configure System Accounting (auditd)
# 4.1.1.1 Configure Data Retention
# 4.1.1.1 Ensure audit log storage size is configured (Not Scored)
# 4.1.1.2 Ensure system is disabled when audit logs are full (Scored)
# 4.1.1.3 Ensure audit logs are not automatically deleted (Scored)
# 4.1.2 Ensure auditd service is enabled (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_1 {

  #class {'::auditd':
  #  max_log_file            => '10', #10mb
  #  space_left_action       => 'email',
  #  action_mail_acct        => 'root',
  #  admin_space_left_action => 'halt',
  #  max_log_file_action     => 'keep_logs',
  #}

  #$cis_audit_messages=[
  #  '(4.1) Configure System Accounting (auditd) package',
  #  '(4.1.2) Configure System Accounting (auditd) service',
  #  '(4.1.1.1) Ensure audit log storage size is configured (Not Scored)',
  #  '(4.1.1.2) Ensure system is disabled when audit logs are full (Scored), space_left_action',
  #  '(4.1.1.3) Ensure audit logs are not automatically deleted (Scored), max_log_file_action ',
  #]

  #notify {$cis_audit_messages:
  #  subscribe => Class[::auditd],
  #}
} #EOF
