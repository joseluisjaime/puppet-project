class php::install {

  package { 'php':
    ensure => installed,
    name => "${php::php_package}",
    }
}
