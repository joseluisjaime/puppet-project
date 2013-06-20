class php (

  $php_package = hiera('php_package'),
  $php_mysql_package = hiera('php_mysql_package'),
  $phpinfo = hiera('phpinfo'),
  $phpini = hiera('phpini'),

)  {


  Class['php::install'] -> Class['php::config']
  
  include php::install
  include php::config

}
