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
    source => "puppet:///modules/haproxy/${haproxy::haproxy_tarball}",
    path => "/opt/${haproxy::haproxy_tarball}",
  }

  exec {"Extract haproxy":
    path => "/bin:/usr/bin",
    subscribe => [ File['haproxy_tarball']],
    unless => "find /opt/${haproxy::haproxy_version}/doc",
    command => "tar -xzf /opt/${haproxy::haproxy_tarball} -C /opt",
  }

  exec {"install haproxy make":
    path => "/bin:/usr/bin",
    subscribe => [ Exec['Extract haproxy']],
    unless => "find /usr/local/sbin/haproxy",
    command => "make TARGET=linux2628 -C /opt/${haproxy::haproxy_version}",
  }

  exec {"install haproxy make install":
    path => "/bin:/usr/bin",
    subscribe => [ Exec['install haproxy make']],
    unless => "find /usr/local/sbin/haproxy",
    command => "make install -C /opt/${haproxy::haproxy_version}",
  }


}
