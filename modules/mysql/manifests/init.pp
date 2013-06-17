class mysql (

  $mysql_package = 'mysql-server',
  $mysql_service = 'mysql',
  $root_password = 'puppet',

)  {

  Class['mysql::install'] ~> Class['mysql::service'] -> Class['mysql::other']
  
  include mysql::install
  include mysql::service
  include mysql::other

}
