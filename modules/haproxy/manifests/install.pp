class haproxy::install {


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
    command => "tar -xzf /opt/haproxy-1.4.24.tar.gz",
  }

  exec {"install haproxy":
    path => "/bin:/usr/bin",
    subscribe => [ Exec['Extract haproxy']],
    unless => "find /usr/local/sbin/haproxy",
    cwd => " /opt/haproxy-1.4.24"
    command => "make TARGET=linux2628 && make install ",
  }


}
