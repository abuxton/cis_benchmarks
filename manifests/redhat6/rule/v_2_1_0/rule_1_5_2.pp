# 1.5.2 Ensure XD/NX support is enabled (Not Scored)
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_1_5_2 {
  case  $facts[architecture]{
    'x86_64': {
      notify{"'(1.5.2) Ensure XD/NX support is enabled (Not Scored)' is unrequired on ${::architecture} architecture":
        }
    }
    default: {
      notify{'(1.5.2) Ensure XD/NX support is enabled (Not Scored) please consider replatforming':
      }
    }
  }
} #EOF
