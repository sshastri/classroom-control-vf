class julyfourth (
  $message
) {

  notify { "This is my message: ${message}" : }

  $fireworks = 'Yea Fireworks!!'

  file { '/tmp/networks' :
    ensure  => file,
    content => template('julyfourth/networks.erb'),
  }


}
