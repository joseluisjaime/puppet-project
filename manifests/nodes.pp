node 'client.example.com' {
  include haproxy
}
node 'client2.example.com' {
  include app_tinyrss
}
node 'client3.example.com' {

}
node 'backend2.example.com' {
  include app_tinyrss
}
node 'backend3.example.com' {
  include apache
  include php
}
node 'puppetclient1.example.com' {
  include prueba
}
node 'balanaux.example.com' {
  include apache
  include php
}
