class users::admins {

  users::managed_user{'jose' : group    => 'root'}
  users::managed_user{'alice' : group  => 'connorhawley'}
  users::managed_user{'chen' :  group  => 'adm'}

}
