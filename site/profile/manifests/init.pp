class users {
  user { 'fundamentals':
    ensure => present,
    #password => 'Windows requires a plain text password',
    }
  }
