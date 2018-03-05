# 6.2.7 Ensure all users' home directories exist (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_7 {

    $valid = $::cis_benchmarks['validhome']

    if $valid != ''
    {
        notify { "(6.2.7) - Ensure all users' home directories exist (Scored): FAILED": }
    }


} #EOF
