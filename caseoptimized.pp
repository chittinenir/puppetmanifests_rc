case $operatingsystem {
centos, redhat: { $apache = "httpd" }
debian, ubuntu: { $apache = "apache2" }
default: { notify {"Unrecognized operating system for webserver": } }
}

package {'apache':
name => $apache,
ensure => latest,
}
