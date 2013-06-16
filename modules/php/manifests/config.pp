class php::config {

  file {'phpinfo':
    ensure => file,
    owner =>
    group =>
    mode =>
    source => 'puppet:///modules/php/info.php',
    path => "${php::phpinfo}"

}
