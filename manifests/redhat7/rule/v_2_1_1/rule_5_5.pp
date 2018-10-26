# 5.5 Ensure root login is restricted to system console (Not Scored)
class cis_benchmarks::redhat7::rule::v_2_1_1::rule_5_5(
  Array $cis_consoles = lookup("${cis_benchmarks::cis_version_base}::cis_consoles"),
) {
  $file ='/etc/securetty'
  if $cis_consoles {
    $cis_consoles.each |$console| {
      file_line { "(5.5) - Ensure root login is restricted to system console (Not Scored). remove ${console}":
        ensure => absent,
        line   => $console,
      }
    }
  }
} #EOF
