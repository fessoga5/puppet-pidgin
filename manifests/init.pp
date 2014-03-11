class puppet-pidgin ($homedir, $username, $server, $password) {
        package { pidgin: ensure => installed }
 
        file { "/home/${homedir}/.purple":
		ensure  => "directory",
		owner   => $homedir,
		mode    => 700,
		require => User[${homedir}],
	}
 
        file { "/home/${homedir}/.purple/accounts.xml":
		replace => "no",
		owner   => $homedir,
		mode    => 600,
		require => User[${homedir}]
		content => template('puppet-pidgin/accounts.xml'),
       	}
}
