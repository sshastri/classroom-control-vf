define user::managed_user{
  user {"${title":
     "directory" => "/home/${title}",
     "groups" => "wheel",
     "shell" => "/bin/bash",
     }
     
 }
     
