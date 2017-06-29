define users::managed_user(
  $user = $title,
  Integer $gid,
  ){
  user { $user:
    ensure      => present,
    managehome  => 'true',
    home        => "/home/${name}",
    managegroup => 'true',
    gid         => $gid,
  
  }
  
  group { $gid:
    ensure => present,
    before[$user],
  }
  
  file { "/home/${user}/.ssh/":
    ensure  => directory,
    owner   =>  $user,
    group   => 'root',
  }
}
  
  
    
