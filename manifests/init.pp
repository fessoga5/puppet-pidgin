class pidgin ($user_name) {
        package { pidgin: ensure => installed }
 
        file { "/home/${user_name}/.purple":
        ensure  => "directory",
        owner   => $user_name,
        mode    => 700,             }
 
        file { "/home/${user_name}/.purple/accounts.xml":
        replace => "no",
        owner   => $user_name,
        mode    => 600,
        content => template('pidgin/accounts.xml'),             }
}
