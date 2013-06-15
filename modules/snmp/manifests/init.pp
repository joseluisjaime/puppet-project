class snmp {
  
  package { 'snmpd':
    ensure => installed,
  }

  file {'/etc/snmp/snmp.conf':
    ensure => file,
    owner => root,
    group => root,
    mode => 0444,
    source => 'puppet:///modules/snmp/snmpd.conf'
  }

  service { 'snmpd':
    ensure => running,
  }

}
