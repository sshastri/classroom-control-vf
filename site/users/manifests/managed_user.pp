define user::managed_user{
  user {"${title}":
     ensure => present,
     home => "/home/${title}",
     groups => "wheel",
     shell => "/bin/bash",
     }
     
 }
     
