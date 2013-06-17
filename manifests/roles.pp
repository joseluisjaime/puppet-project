class role_lamp {
  $role_lamp = hiera('role_lamp')
  
  class {'apache':}
  class {'php':}
  class {'mysql':}
}

class app_tinyrss inherits role_lamp {
  require => class['role_lamp']
  class {'tinyrss':}
  
}
