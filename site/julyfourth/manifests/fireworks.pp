define julyfourth::fireworks {

  file { "/tmp/${title}" :
    ensure =>  present,
  }


}
