class snmp::service {

  service {'snmp':
    ensure => running,
    name => "${snmp::params::service}",
    }
  
}
