class profile::base {
  #notify { "Hello, my name is ${::hostname}": }
  $mymessage = hiera('message')
  notify { $mymessage :}
}
