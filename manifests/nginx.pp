#The reason I've set 'default' is because every time a node is created, puppet should assume it's another Nginx server
node default {
class { 'nginx': }
#Erasing the default index page and replacing it with Hello World
file {'/usr/share/nginx/html/index.html':
content => "Hello World",
require => Class["nginx"]
}
}