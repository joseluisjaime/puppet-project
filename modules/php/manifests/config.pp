class php::config {

  file {'phpinfo':
    ensure => file,
    owner => www-data,
    group => www-data,
    mode => 0644,
    source => 'puppet:///modules/php/info.php',
    path => "${php::phpinfo}",
    }
}
