node default {
}
node 'client.example.com' inherits default {
  class {'apache':}
  class {'php':}
  class {'mysql':}
}
node 'client2.example.com' inherits default {
}
