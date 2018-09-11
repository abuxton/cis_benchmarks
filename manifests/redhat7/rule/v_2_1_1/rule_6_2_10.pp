# 6.2.10 Ensure users' dot files are not group or world writable (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_10 {

    $files = $::cis_benchmarks['validate_user_dot_files']

    if $files != undef and $files != ''
    {
        notify { '(6.2.10) - Ensure users dot files are not group or world writable (Scored): Failed': }
    }


} #EOF
