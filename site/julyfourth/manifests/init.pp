class julyfourth {

  notify { "Party like it's 1776" : }

  file { '/tmp/networks' :
    ensure  => file,
    content => epp('julyfourth/networks.epp'),
  }


}
