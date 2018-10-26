class cis_benchmarks::redhat7::rule::v_1_0_0::rule_3_7n9n10n11n12n13n14n15 (
  Hash $removepackage = lookup('name' => "${cis_benchmarks::cis_version_base}::removeserverpackage", 'default_value' => {}),
) {
  # includes Rules:
  # 3.7 - Remove LDAP (Not Scored)# 3.9 - Remove DNS Server (Not Scored)
  # 3.9 - Remove DNS Server (Not Scored)
  # 3.10 - 3.10 Remove FTP Server (Not Scored)
  # 3.11 - 3.11 Remove HTTP Server (Not Scored)
  # 3.12 - 3.12 Remove Dovecot (IMAP and POP3 services) (Not Scored)
  # 3.13 - 3.13 Remove Samba (Not Scored)
  # 3.14 - 3.14 Remove HTTP Proxy Server (Not Scored)
  # 3.15 - 3.15 Remove SNMP Server (Not Scored)

  $removepackage.each |$package, $ishouldremove| {
    if $ishouldremove {
      package { $package:
        ensure => absent,
      }
    }
  }

} #EOF
