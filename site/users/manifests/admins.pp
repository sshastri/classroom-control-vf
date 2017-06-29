class users::admins{
  users:managed_users'peter'}
  users:managed_user{'kate':
    group  => 'staff',
  }
   users:managed_user{'aaron':
     group  => 'staff',
   }
   group {'staff:
     ensure  => present,
   }
 }
