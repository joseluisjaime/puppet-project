class mysql::other {
  
  exec { “Set MySQL server root password”:
#    subscribe => [ Package["mysql-server"]],
    refreshonly => true,
    unless => "mysqladmin -uroot -p${mysql::root_password} status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password ${mysql::root_password}",
  }

}
