define users::managed_user(
  $user = $title,
  String $group,
  ){
  user { $user:
    ensure      => present,
    managehome  => 'true',
    home        => "/home/${name}",
  }
  

  file { "/home/${user}/.ssh/":
    ensure  => directory,
    owner   =>  $user,
    group   => 'root',
  }
}
  
  
    
