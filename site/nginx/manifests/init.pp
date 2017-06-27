class nginx {
   package {"nginx":
     ensure => present,
     }
   file {"/var/www":
      Ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0755',
      }
 }
     
   
