# 4.1.12 Ensure use of privileged commands is collected (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_1_12 (
  Array $cis_audit_partitions = lookup("${cis_benchmarks::cis_version_base}::cis_audit_partitions"),
) {

  include ::cis_benchmarks::redhat7::rule::v_2_1_1::rule_4_1
  $cis_audit_partitions.each |$partition| {

    auditd::rule { '(4.1.4) - Ensure events that modify date and time information are collected (Scored), 64bit':
      content => "-a always,exit -F path='${partition}' -F perm=x -F auid>=1000 -F auid!=4294967295 -k privileged",
    }
  }

} #EOF
