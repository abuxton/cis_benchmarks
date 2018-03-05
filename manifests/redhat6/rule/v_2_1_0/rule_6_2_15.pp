# 6.2.15 Ensure all groups in /etc/passwd exist in /etc/group (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_15 {


    $group = $::cis_benchmarks['checkgroup']

    if $group != ''
    {
        notify { '(6.2.15) - Ensure all groups in /etc/passwd exist in /etc/group (Scored): FAILED': }
    }


  } #EOF
