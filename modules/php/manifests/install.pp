class php::install {

  Package['php'] -> Package['php_mysql']
  
  package { 'php':
    ensure => installed,
    name => "${php::php_package}",
  }

  package { 'php_mysql':
    ensure => installed,
    name => "${php::php_mysql_package}",
  }
  
}
