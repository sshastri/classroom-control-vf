define users::managed_user(
  $name = $title, 
  ){
  user { $name:
    ensure      => present,
    managehome  => 'true',
    home        => "/home/${name}",
  }
  
  file { '~/.ssh/':
    ensure  => directory,
    owner   =>  $name,
    group   => 'root',
  }
}
  
  
    
