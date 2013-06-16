class apache::service {

  service {'apache':
    ensure => running,
    name => "${apache::apache_service}",
    }

}
