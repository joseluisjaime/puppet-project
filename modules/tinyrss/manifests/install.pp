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
    unless => "find ${tinyrss::tinyrss_directory}",
    command => "tar -xzf /tmp/Tiny-Tiny-RSS-1.8.tar.gz --strip=1 -C ${tinyrss::tinyrss_directory}",
  }
}
