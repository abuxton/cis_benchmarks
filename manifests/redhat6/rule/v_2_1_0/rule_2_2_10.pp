# 2.2.10 Ensure HTTP server is not enabled (Scored)
# Several httpd servers exist and can use other service names.
# apache, apache2, lighttpd, and nginx are example services that provide an HTTP server.
# These and other services should also be audited.
class cis_benchmarks::redhat6::rule::v_2_1_0::rule_2_2_10 {
  service{ '(2.2.10) - Disable HTTP Server (Scored)':
    name   => 'httpd',
    enable => false,
  }

} #EOF
