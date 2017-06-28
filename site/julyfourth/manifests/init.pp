class julyfourth {

  notify { "Party like it's 1776" : }

  $fireworks = 'Yea Fireworks!!'

  file { '/tmp/networks' :
    ensure  => file,
    content => template('julyfourth/networks.epp'),
  }


}
