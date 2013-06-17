node default {
}
class lamp {
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
