class snmp {

  Package['snmp'] -> File['snmpd.conf'] ~> Service['snmp']

  $package = 'snmpd'
  $configfile = '/etc/snmp/snmpd.conf'
  $service = 'snmpd'
  
  package { 'snmp':
    ensure => installed,
    name => "${package}",
  }

  file {'snmpd.conf':
    ensure => file,
    owner => root,
    group => root,
    mode => 0444,
    #source => 'puppet:///modules/snmp/snmpd.conf'
    content => template('snmp/snmpd.conf.erb'),
    path => "${configfile}"
  }

  service { 'snmp':
    ensure => running,
    name => "${service}"
  }

}
