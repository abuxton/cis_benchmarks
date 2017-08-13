# 6.2.8 Ensure users' home directories permissions are 750 or more restrictive (Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_6_2_8 {
validate_user_homes
$valid = $::cis_benchmarks['validate_user_homes']

if $valid != ''
{
    notify { "(6.2.8) - Ensure users' home directories permissions are 750 or more restrictive (Scored): FAILED: ${valid}": }
}

} #EOF
