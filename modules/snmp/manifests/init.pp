class snmp (

  $package = 'snmpd',
  $configfile = '/etc/snmp/snmpd.conf',
  $service = 'snmpd',
  $community = 'puppet',
  $syscontact = 'joseluis <jose@gmail.com>',
  $server = '127.0.0.1',
  

)  {

  Class['snmp::install'] -> Class['snmp::config'] ~> Class['snmp::service']
  
  include snmp::install
  include snmp::config
  include snmp::service

}
