class mysql::other {
  
  exec { "Set Mysql Root Password":
    subscribe => [ Package["mysql-server"]],
    refreshonly => true,
    unless => "mysqladmin -uroot -p${mysql::root_password} status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password ${mysql::root_password}",
  }

}
