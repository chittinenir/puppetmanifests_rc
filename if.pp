$x = "Hell"
if $x == "Hello" {
file {"/tmp/hello":
ensure => present,
}}
else {
file {"/tmp/nothello":
ensure => present,
}}

