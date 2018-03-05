# 6.2.10 Ensure users' dot files are not group or world writable (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_10 {

    $files = $::cis_benchmarks['validate_user_dot_files']

    if $files != ''
    {
        notify { '(6.2.10) - Ensure users dot files are not group or world writable (Scored): Failed': }
    }


} #EOF
