class profile::base {

  $mymessage = hiera('message')

  notify { "Hello, my name is ${::hostname}": }
  notify { "My message is ${mymessage}": }
}
