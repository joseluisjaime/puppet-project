node default {
}
class lamp {

  Class['apache'] -> Class['php'] -> Class['mysql']
  
  class {'apache':}
  class {'php':}
  class {'mysql':}  

}
node 'client.example.com' inherits default {
  class {'apache':}
  class {'php':}
  class {'mysql':}
}
node 'client2.example.com' inherits default {
  include lamp
}
