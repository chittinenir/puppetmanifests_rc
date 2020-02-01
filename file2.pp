# resourceype {"specific_resource_name":
# desired_state_definition_parameter => desired_state_value,
# }

file {"/tmp/virtualfile1.txt":
ensure => present,
content => "$virtual\n"
}
