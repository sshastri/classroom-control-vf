class users::admins {

  users::managed_user{'jose' : gid    => 12345}
  users::managed_user{'alice' : gid   => 54321}
  users::managed_user{'chen' :  gid   => 98765}

}
