define users::managed_user(
  $name, $group, $sshdir
  ){
  file {
  user { $name:
    managehome => 'true',
    home   => "/home/${name}',
    group  =>
  
  }
}
  
  
    
