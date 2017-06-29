define users::managed_user(
  $group = $title,
){
  user {$title:
    ensuer  => present,
}
file{"/home/${title}":
  ensure  => directory,
  owner   => $title,
  group   => $group,
 }
}
