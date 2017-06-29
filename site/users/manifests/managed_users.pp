define users:managed_users (
  
  $user = $title,
) 
  
    { 
  user { $user:
	ensure => present;
   }
  
  file { "/home/${user}" :
    ensure => directory,
    }
 
  file { "/home/${user}/.ssh" :
    ensure => directory,
    owner => $user,
    group => $user,
    mode => 0644,
    }
    
}
