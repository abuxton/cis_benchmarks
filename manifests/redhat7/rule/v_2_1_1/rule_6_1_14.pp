# 6.1 System File Permissions
# 6.1.14 Audit SGID executables (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_1_14 {


    $files = $::cis_benchmarks['sgid_exec']

    if $files != ''
    {
        notify { '(6.1.14) Audit SGID executables (Not Scored), FAILED': }
    }


} #EOF
