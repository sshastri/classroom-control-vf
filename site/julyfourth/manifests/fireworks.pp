define julyfourth::fireworks(
  $message,
) {

  file { "/tmp/${title}" :
    ensure  => present,
    content => $message,
  }


}
