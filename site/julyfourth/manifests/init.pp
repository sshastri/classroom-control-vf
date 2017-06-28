class julyfourth {

  notify { "Party like it's 1776" : }

  $var = 'Fireworks are amazing'

  file { '/tmp/networks' :
    ensure  => file,
    content => epp('julyfourth/networks.epp'),
  }


}
