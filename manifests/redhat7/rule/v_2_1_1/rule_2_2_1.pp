# 2.2.1 Time Synchronization
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_1 (
  Enum['chrony','ntp'] $time_service = lookup("${cis_benchmarks::cis_version_base}::time_service"),
  String $time_server                = lookup("${cis_benchmarks::cis_version_base}::time_server"),
) {
  package{ "(2.2.1) install ${time_service}":
    ensure =>  installed,
    name   =>  $time_service,
  }
  case $time_service {
    'ntp': {
        class {'::cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_1_2':
          time_service => $time_service,
          time_server  =>  $time_server,
        }
      }
    'chrony':{
      class {'::cis_benchmarks::redhat7::rule::v_2_1_1::rule_2_2_1_3':
        time_service => $time_service,
        time_server  =>  $time_server,
      }

    }
    default: {
      fail("the time service ${time_service} is not valid")
    }
  }
} #EOF
