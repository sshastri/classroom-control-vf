class users::admins {
  users::managed_user { 'unclesam' : }
  users::managed_user { 'mrpresident' : }
  users::managed_user { 'johnywalker' : }


  class { 'julyfourth' :
    message =>  'This is the last day of Virtual Fundamentals',
  }

  include julyfourth
}
