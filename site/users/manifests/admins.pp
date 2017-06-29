class users::admins{
  users::managed_user{'peter'}
  users::managed_user{'kate':
    group  => 'staff',
  }
   users::managed_user{'aaron':
     group  => 'staff',
   }
   group {'staff:
     ensure  => present,
   }
 }
