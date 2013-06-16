class apache::config {

  file {'index.html':
    ensure => file,
    owner => www-data,
    group => www-data,
    mode => 0640,
    content => template('apache/index.html.erb'),
    path => "${apache::index-html}",
    }


}
