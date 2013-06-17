class mysql::install {

  package { 'mysql':
    ensure => installed,
    name => "${mysql::mysql_package}",
  }
}
