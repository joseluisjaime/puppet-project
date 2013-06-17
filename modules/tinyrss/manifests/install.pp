class tinyrss::install {

  file {'tinyrss_directory':
    ensure => directory,
    owner => www-data,
    group => www-data,
    mode => 0640,
    path => "${tinyrss::tinyrss_directory}",   
  }

  exec { "Extract tinyrss":
    #   subscribe => [ File['tinyrss_directory']],
    #    refreshonly => true,
    path => "/bin:/usr/bin",
    unless => "find ${tinyrss::tinyrss_directory}",
    command => "tar -xzf ${tinyrss::tarball} --strip=1 -C ${tinyrss::tinyrss_directory}",
  }
}
