define users::managed_user(
  $name = $title, 
  $gid, 
  ){
  user { $name:
    ensure      => present,
    managehome  => 'true',
    home        => "/home/${name}',
    gid         => $gid,
  }
}
  
  
    
