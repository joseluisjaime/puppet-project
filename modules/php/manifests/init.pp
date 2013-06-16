class php (

  $php_package = 'php5',
  $php_mysql_package = 'php5-mysql',
  $phpinfo = '/var/www/info.php'

)  {


  Class['php::install'] -> Class['php::config']
  
  include php::install
  include php::config

}
