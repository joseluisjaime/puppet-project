class mysql (

  $mysql_package = hiera('mysql_package'),
  $mysql_service = hiera('mysql_service'),
  $mysql_root_password = hiera('mysql_root_password'),

)  {

  Class['mysql::install'] ~> Class['mysql::service'] -> Class['mysql::other']
  
  include mysql::install
  include mysql::service
  include mysql::other

}
