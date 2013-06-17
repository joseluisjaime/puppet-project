class role_lamp {
  $role_lamp = hiera('role_lamp')
  
  class {'apache':}
  class {'php':}
  class {'mysql':}
}
