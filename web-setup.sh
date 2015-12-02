#!/bin/bash


# Install apache
 yum install -y httpd
  cat > /var/www/index.html <<EOD
<html><head><title>${HOSTNAME}</title></head><body><h1>${HOSTNAME}</h1>
<p>This is the default web page for ${HOSTNAME}.</p>
</body></html>
EOD

  # Log the X-Forwarded-For
  perl -pi -e  's/^LogFormat "\%h (.* combined)$/LogFormat "%h %{X-Forwarded-For}i $1/' /etc/httpd/conf/httpd.conf
  /sbin/service httpd restart

