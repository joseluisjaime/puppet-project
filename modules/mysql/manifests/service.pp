class mysql::service {

  service {'mysql':
    ensure => running,
    name => "${mysql::mysql_service}",
  }

}
