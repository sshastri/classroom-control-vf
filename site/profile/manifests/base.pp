class profile::base {
  $msg = heira('message')
  notify { "My message from heira is ${msg}": }
}
