class tinyrss::install {

  file {'tinyrss_directory':
    ensure => directory,
    owner => www-data,
    group => www-data,
    mode => 0640,
    path => "${tinyrss::tinyrss_directory}",   
  }

  file {'tinyrss_tarball':
    ensure => present,
    owner => www-data,
    group => www-data,
    mode => 0775,
    source => 'puppet:///modules/tinyrss/Tiny-Tiny-RSS-1.8.tar.gz',
    path => '/tmp/Tiny-Tiny-RSS-1.8.tar.gz',
  }

  exec { "Extract tinyrss":
    subscribe => [ File['tinyrss_directory']],
    path => "/bin:/usr/bin",
    unless => "find ${tinyrss::tinyrss_directory}/themes",
    command => "tar -xzf /tmp/Tiny-Tiny-RSS-1.8.tar.gz --strip=1 -C ${tinyrss::tinyrss_directory}",
  }

  exec { "Create tinyrss database":
    #    subscribe => [ Exec["Extract tinyrss"]],
    path => "/bin:/usr/bin",
    unless => "mysql -u${tinyrss::tinyrss_user} -p${tinyrss::tinyrss_password} ${tinyrss::tinyrss_database}",
    command => "mysql -uroot -p${tinyrss::mysql_root_password} -e \"create database ${tinyrss::tinyrss_database}; grant all on ${tinyrss::tinyrss_database}.* to ${tinyrss::tinyrss_user}@localhost identified by '${tinyrss::tinyrss_password}';\"",
  }
  
}
