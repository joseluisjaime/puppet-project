class php (

  $php_package = 'php5',
  $phpinfo = '/var/www/info.php'

)  {


  Class['php::install'] -> Class['php::config']
  
  include php::install
  include php::config

}
