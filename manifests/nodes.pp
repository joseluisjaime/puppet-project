node 'client.example.com' {
  include haproxy
}
node 'client2.example.com' {
  include apache
  include php
}
node 'client3.example.com' {

}
  
