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
    source => 'puppet:///modules/tinyrss/${tinyrss::tarball}',
    path => '/tmp/${tinyrss::tarball}',
  }

  exec { "Extract tinyrss":
    subscribe => [ File['tinyrss_directory']],
    path => "/bin:/usr/bin",
    unless => "find ${tinyrss::tinyrss_directory}/themes",
    command => "tar -xzf /tmp/${tinyrss::tarball} --strip=1 -C ${tinyrss::tinyrss_directory}",
  }
}
