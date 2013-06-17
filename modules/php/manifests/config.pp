class php::config {

  file {'phpinfo':
    ensure => file,
    owner => www-data,
    group => www-data,
    mode => 0644,
    source => 'puppet:///modules/php/info.php',
    path => "${php::phpinfo}",
    }

    file {'phpini':
      ensure => file,
      owner => root,
      group => root,
      mode => 0644,
      source => 'puppet:///modules/php/php.ini',
      path => "${php::phpini}",
    }
    
}
