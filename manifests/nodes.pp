node 'client.example.com' {
  include app_tinyrss
  include haproxy
}
node 'client2.example.com' {
  include app_tinyrss
}
node 'client3.example.com' {

}
