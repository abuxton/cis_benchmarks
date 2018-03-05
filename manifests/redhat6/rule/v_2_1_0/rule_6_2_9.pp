# 6.2.9 Ensure users own their home directories (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_9 {

    $valid = $::cis_benchmarks['userhome']

    if $valid != ''
    {
        notify { '(6.2.9) Ensure users own their home directories (Scored): FAILED': }
    }


} #EOF
