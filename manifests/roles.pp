class aptupdate {
  exec { 'aptupdate':
    path => "/bin:/usr/bin",
    command => "apt-get -y update",
    timeout => 600,
  }
}

class role_lamp {

  stage { 'update': before => Stage['first'] }
  stage { 'first': before => Stage['main'] }

  $role_lamp = hiera('role_lamp')

  class {'aptupdate':
    stage => update,
  }

  
  class {'apache':}
  class {'php':}
  class {'mysql':}
}

class app_tinyrss {
  stage { 'update': before => Stage['first'] }
  stage { 'first': before => Stage['main'] }

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
