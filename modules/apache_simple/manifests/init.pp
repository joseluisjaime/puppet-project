class apache_simple {
  Package['apache package']  -> File['index.html file'] ~> Service['apache service']

  package { 'apache package':
    ensure => installed,
    name => "apache2",
  }

  file {'index.html file':
    ensure => file,
    owner => www-data,
    group => www-data,
    mode => 0640,
    source => "puppet:///modules/apache_simple/index.html",
    path => "/vaw/www/index.html",
  }

  service {'apache service':
    ensure => running,
    name => "apache2",
  }
}
        
