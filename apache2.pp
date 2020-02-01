# resourcetype {"specificrresource_name":
# desired_state_definition_parameter => desired_state_value,
# }

package {"apache2":
ensure => present,
}

service {"apache2":
ensure => running,
}

file {"/var/www/html/index.html":
ensure => present,
content => "Hello World"
}



