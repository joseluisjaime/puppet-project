class apache::service {

  service {'apache':
    ensure => running,
    name => "${apache::service}",
    }

}
