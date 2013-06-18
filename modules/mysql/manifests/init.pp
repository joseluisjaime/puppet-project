class mysql (

  $mysql_package = 'mysql-server',
  $mysql_service = 'mysql',
  $mysql_root_password = hiera('mysql_root_password'),

)  {

  Class['mysql::install'] ~> Class['mysql::service'] -> Class['mysql::other']
  
  include mysql::install
  include mysql::service
  include mysql::other

}
