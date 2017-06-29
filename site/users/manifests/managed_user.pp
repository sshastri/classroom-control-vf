define users::managed_user(
  $user = $title, 
  ){
  user { $user:
    ensure      => present,
    managehome  => 'true',
    home        => "/home/${name}",
  }
  
  file { '~/.ssh/':
    ensure  => directory,
    owner   =>  $user,
    group   => 'root',
  }
}
  
  
    
