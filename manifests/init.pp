class puppet-pidgin ($homedir, $username, $server, $password) {
        package { pidgin: ensure => installed }
 
        file { "/home/${homedir}/.purple":
		ensure  => "directory",
		owner   => $homedir,
		mode    => 700,
	}
 
        file { "/home/${homedir}/.purple/accounts.xml":
		replace => "no",
		owner   => $homedir,
		mode    => 600,
		require => File["/home/$homedir/.purple"],
		content => template('puppet-pidgin/accounts.xml'),
      	}

        file { "/home/${homedir}/.purple/prefs.xml":
		replace => "no",
		owner   => $homedir,
		mode    => 600,
		require => File["/home/$homedir/.purple"],
		content => template('puppet-pidgin/prefs.xml'),
      	}
}
