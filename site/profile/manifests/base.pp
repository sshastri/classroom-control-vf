class profile::base {
  $msg = hiera('message')
  notify { "My message from heira is ${msg}": }
}
