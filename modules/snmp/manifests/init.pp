class snmp {

  Class['snmp::params'] -> Class['snmp::install'] -> Class['snmp::config'] ~> Class['snmp::service']
  
  include snmp::params
  include snmp::install
  include snmp::config
  include snmp::service

}
