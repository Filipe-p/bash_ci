#!/bin/bash

if (( $# > 0 ))
then
  hostname=$1
else
  echo "WTF: you must supply a hostname or IP address" 1>&2
  exit 1
fi

# hostname=$1

ssh -o StrictHostKeyChecking=no -i ~/.ssh/FilipePaivaKey.pem ec2-user@$hostname '


sudo yum -y install httpd
if rpm -qa | grep "^httpd-[0-9]" >/dev/null 2>&1
then
  sudo systemctl start httpd
else
  exit 1
fi

sudo sh -c "cat >/var/www/html/index.html <<_END_
<h1>
 Citi Groups Cerver 🔥
</h1>

<h3>refresh for a new picture</h3>
<img src="https://source.unsplash.com/random" alt="">

_END_"
'
