class aptupdate {
  exec { 'apt-get -y update': }
}

class role_lamp {
  $role_lamp = hiera('role_lamp')
  
  class {'apache':}
  class {'php':}
  class {'mysql':}
}

class app_tinyrss {
  stage { 'update': before => Stage['first'] }
  stage { 'first': before => Stage['main'] }
  stage { 'last': require => Stage['main'] }

  class {'aptupdate':
    stage => update,
  }
  
  class {'role_lamp':
    stage => first,
  }
  class {'tinyrss':
    stage => main,
  }  
}
