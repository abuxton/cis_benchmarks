# 6.2.7 Ensure all users' home directories exist (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_7 {

    $valid = $::cis_benchmarks['validhome']

    if $valid != undef and $valid != ''
    {
        notify { "(6.2.7) - Ensure all users' home directories exist (Scored): FAILED": }
    }


} #EOF
