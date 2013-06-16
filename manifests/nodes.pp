node default {
}
node 'client.example.com' inherits default {
  class {'apache':}
  class {'php':}
}
node 'client2.example.com' inherits default {
}
