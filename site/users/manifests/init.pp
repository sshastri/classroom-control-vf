# @class users
#
# @description controls users
#
# @usage include users
#

class users {

  user { 'fundamentals':
    ensure => present,
  }

}
