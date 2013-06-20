class haproxy::service {

  service {'haproxy service':
    ensure => running,
    enable => true,
    name => "${haproxy::haproxy_service}"

  }
  
}
