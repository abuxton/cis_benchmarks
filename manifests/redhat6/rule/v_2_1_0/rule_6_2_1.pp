# 6.1 System File Permissions
# 6.2.1 Ensure password fields are not empty (Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_6_2_1 {


    $users = $::cis_benchmarks['password_fields']

    if $users != ''
    {
        notify { '6.2.1 Ensure password fields are not empty (Scored), FAILED': }
    }


} #EOF
