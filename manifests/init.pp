# class mtn_cis
#cis implimentation
#
class mtn_cis(
  String $cis_version = lookup('mtn_cis::version', String,'first','v1_1_1')
  ) inherits ::mtn_cis::params{

  }
