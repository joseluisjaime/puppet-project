class haproxy::install {


  file {'haproxy_tarball':
    owner => root,
    group => root,
    mode => 0775,
    source => 'puppet:///modules/haproxy/haproxy-1.4.24.tar.gz',
    path => '/tmp/haproxy-1.4.24.tar.gz',
  }

  exec {"Extract haproxy":
    path => "/bin:/usr/bin",
    subscribe => [ File['haproxy_tarball']],
    unless => "find /tmp/haproxy-1.4.24/doc",
    command => "tar -xzf /tmp/haproxy-1.4.24.tar.gz",
  }
}
