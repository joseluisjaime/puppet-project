class tinyrss::config {
  

  file {'tinyrss config file':
    ensure => file,
    owner => www-data,
    group => www-data,
    mode => 0755,
    content => template('tinyrss/config.php.erb'),
    path => "${tinyrss::tinyrss_directory}/config.php"
  }

  exec {'set owner and group tinyrss':
    subscribe => [ File['tinyrss config file']],
    path => "/bin:/usr/bin",
    command => "chown -R www-data:www-data ${tinyrss::tinyrss_directory}"
  }

  exec { "Populate tinyrss database":
    #            subscribe => [ Exec["Extract tinyrss"]],
    path => "/bin:/usr/bin",
    unless => "mysql -u${tinyrss::tinyrss_user} -p${tinyrss::tinyrss_password} ${tinyrss::tinyrss_database} -e \" select * from ttrss_users;\" ",
    command => "mysql -u${tinyrss::tinyrss_user} -p${tinyrss::tinyrss_password} ${tinyrss::tinyrss_database} < ${tinyrss::tinyrss_directory}/schema/ttrss_schema_mysql.sql",
  }
  
}
