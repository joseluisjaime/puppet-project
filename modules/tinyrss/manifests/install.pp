class tinyrss::install {

  file {'tinyrss_directory':
    ensure => directory,
    owner => www-data,
    group => www-data,
    mode => 0640,
    path => "${tinyrss::tinyrss_directory}",   
  }

  file {'tinyrss_tarball':
    ensure => file,
    owner => www-data,
    group => www-data,
    mode => 0775
    source => 'puppet:///modules/tinyrss/${tinyrss::tarball}',
    path => '/temp/'
  }
  
  exec { "Extract tinyrss":
    #   subscribe => [ File['tinyrss_directory']],
    refreshonly => true,
    path => "/bin:/usr/bin",
    unless => "find ${tinyrss::tinyrss_directory}",
    command => "tar -xzf /temp/${tinyrss::tarball} --strip=1 -C ${tinyrss::tinyrss_directory}",
  }
}
