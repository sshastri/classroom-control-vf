define users:managed_users (
  
  $user = $title,
  $user_home = /home/$user,
  $user_group = $user,) 
  
    { 
  user { “${title}”:
	ensure => present;
	  }
  
  file { "/home/${user}/.ssh" :
    ensure => directory,
    }
   }
    
