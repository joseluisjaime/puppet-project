class apache::install {

  package { 'apache':
    ensure => installed,
    name => "${apache::apachepackage}",
  }
  
}
