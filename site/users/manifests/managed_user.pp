define users::managed_user(
  $user = $title,
  Integer $gid,
  ){
  user { $user:
    ensure      => present,
    managehome  => 'true',
    home        => "/home/${name}",
    gid         => $gid,
  }
  
  file { "/home/${user}/.ssh/":
    ensure  => directory,
    owner   =>  $user,
    group   => 'root',
  }
}
  
  
    
