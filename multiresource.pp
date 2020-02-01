# resourcetype {"specific_resource_name":
# desired_state_definition_parameter => desired_state_value,
# }

file {"/tmp/file2.txt":
ensure => present,
content => "Hello World"
}


# resourcetype {"specific_resource_name":
# desired_state_definition_parameter => desired_state_value,
# }

file {"/tmp/file1.txt":
ensure => present,
}


class { 'java':
  distribution => 'jre',
}
# resourcetype {"specific_resource_name":
# desired_state_definition_parameter => desired_state_value,
# }

package {"ntp":
ensure => present,
}


service {"ntp":
ensure => stopped,
}
tomcat::install { '/opt/tomcat':
  source_url => 'https://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.x/bin/apache-tomcat-7.0.x.tar.gz',
}
tomcat::instance { 'default':
  catalina_home => '/opt/tomcat',
}
# resourcetype {"specific_resource_name":
# desired_state_definition_parameter => desired_state_value,
# }

user {"steve":
ensure => present,
}


