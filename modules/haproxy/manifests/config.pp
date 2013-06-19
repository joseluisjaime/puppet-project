class haproxy::config {

  File['haproxy init.d'] ->  File['haproxy default'] ->  File['haproxy config directory'] ->  File['haproxy config']

  file {'haproxy init.d':
    ensure => file,
    owner => root,
    group => root,
    mode => 0755,
    path => '/etc/init.d/haproxy',
    source => 'puppet:///modules/haproxy/haproxy-initd'
  }

    file {'haproxy default':
    ensure => file,
    owner => root,
    group => root,
    mode => 0644,
    path => '/etc/default/haproxy',
    source => 'puppet:///modules/haproxy/haproxy-default'
  }

  file {'haproxy config directory':
    ensure => directory,
    owner => root,
    group => root,
    mode => 0755,
    path => "/etc/haproxy",
  }
      

  file {'haproxy config':
    ensure => file,
    owner => root,
    group => root,
    mode => 0644,
    path => '/etc/haproxy/haproxy.cfg',
    content => template('haproxy/haproxy.cfg.erb'),
  }

}
