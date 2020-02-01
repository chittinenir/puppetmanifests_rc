# resourcetype {"specific_resource_name":
# desired_state_definition_parameter => desired_state_value,
# }

file {"/tmp/file2.txt":
ensure => present,
content => "Hello World"
}


