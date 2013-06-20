class haproxy::install {

  Package['socat'] -> File['haproxy_tarball'] -> Exec["Extract haproxy"] -> Exec["install haproxy make"] -> Exec["install haproxy make install"]
  

  package {'socat':
    ensure => installed,
    name => "${haproxy::haproxy_socat_package}",
  }


  
  file {'haproxy_tarball':
    owner => root,
    group => root,
    mode => 0775,
    source => 'puppet:///modules/haproxy/haproxy-1.4.24.tar.gz',
    path => '/opt/haproxy-1.4.24.tar.gz',
  }

  exec {"Extract haproxy":
    path => "/bin:/usr/bin",
    subscribe => [ File['haproxy_tarball']],
    unless => "find /opt/haproxy-1.4.24/doc",
    command => "tar -xzf /opt/haproxy-1.4.24.tar.gz -C /opt",
  }

  exec {"install haproxy make":
    path => "/bin:/usr/bin",
    subscribe => [ Exec['Extract haproxy']],
    unless => "find /usr/local/sbin/haproxy",
    command => "make TARGET=linux2628 -C /opt/haproxy-1.4.24",
  }

  exec {"install haproxy make install":
    path => "/bin:/usr/bin",
    subscribe => [ Exec['install haproxy make']],
    unless => "find /usr/local/sbin/haproxy",
    command => "make install -C /opt/haproxy-1.4.24",
  }


}
