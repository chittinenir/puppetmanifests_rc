$package_name = "nginx"
$package_status = "present"
$status = "running"
$file_path = "/usr/share/nginx/html/index.html"
$file_content  = "Hello World"

# resourcetype {"specificrresource_name":
# desired_state_definition_parameter => desired_state_value,
# }

package {"$package_name":
ensure => "$package_status",
}

service {"$package_name":
ensure => "$status",
}

file {"$file_path":
ensure => "$package_status",
content => "$file_content"
}

