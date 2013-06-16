node default {
}
node 'client.example.com' inherits default {
  class {'apache':}
}
node 'client2.example.com' inherits default {
}
