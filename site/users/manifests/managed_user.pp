define users::managed_user(
  $user = $title,
) {

  user { $user :
    ensure =>  present,
  }

  file { "/home/${user}" :
    ensure => directory,
  }

  file { "/home/${user}/.bashrc" :
    ensure  => file,
    content => epp('users/bashrc.epp', { user => $user }),
    owner   => $user,
    group   => $user,
    mode    => '0644',
  }
}
