node 'client.example.com' {
  include haproxy
}
node 'client2.example.com' {
  include apache
  include php
}
node 'client3.example.com' {

}
node 'node1.example.com' {
  include app_tinyrss
  }
node 'balanaux.example.com' {
  include apache
  include php
}
