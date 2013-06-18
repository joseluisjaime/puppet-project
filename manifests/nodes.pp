node default {
}

node 'client.example.com' inherits default {
  include role_lamp
}
node 'client2.example.com' inherits default {
  include app_tinyrss
}
