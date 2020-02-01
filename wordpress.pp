# To update everytime prior to installing any packages
exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>
package {"apache2":
ensure => present,
}
# To install packages needed
package {"mysql-server":
ensure => present,
}
package {"mysql-client":
ensure => present,
}
package {"php":
ensure => present,
}
package {"libapache2-mod-php":
ensure => present,
}
package {"php-mcrypt":
ensure => present,
}
package {"php-mysql":
ensure => present,
}
package {"unzip":
ensure => present,
}
# To Set Mysql root password
exec { "Set MySQL server root password":
path => "/bin:/usr/bin",
command => "mysqladmin -uroot password rootpassword && touch /var/file1",
creates => "/var/file1"
}
# To fetch commands from destination and save it in an desired location
exec {"wget https://gitlab.com/roybhaskar9/devops/raw/master/coding/chef/chefwordpress/files/default/mysqlcommands":
path => "/usr/bin/",
cwd => "/tmp/",
creates => "/tmp/mysqlcommands"
}
exec { "Executing mysqlcommands":
path => "/bin:/usr/bin",
command => "mysql -uroot -prootpassword < /tmp/mysqlcommands && touch /var/file2",
creates => "/var/file2"
}
exec {"wget https://wordpress.org/latest.zip":
path => "/usr/bin/",
cwd => "/tmp/",
creates => "/tmp/latest.zip"
}
->
exec { 'unzip':
command     => 'unzip -o /tmp/latest.zip -d /var/www/html',
cwd         => '/tmp/',
path        => '/usr/bin/',
creates     => '/var/www/html/wordpress/index.php'
}
exec {"wget https://gitlab.com/roybhaskar9/devops/raw/master/coding/chef/chefwordpress/files/default/wp-config-sample.php":
path => "/usr/bin/",
cwd => "/tmp/",
creates => "/tmp/wp-config-sample.php",
}
file { '/var/www/html/wordpress/wp-config.php':
source       => '/tmp/wp-config-sample.php'
}
file  {'/var/www/html/wordpress':
    owner   =>  'www-data',
    group   =>  'root',
    ensure  =>  directory,
    recurse => true,
    mode    => '0775',
}
service {"apache2":
}
