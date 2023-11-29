# Install Nginx web server (w/ Puppet)
exec { 'server configuration':
  provider => shell,
  command  => 'sudo apt-get -y update; sudo apt-get -y install nginx; echo "Hello World!" | sudo tee /var/www/html/index.html; echo "http {\\n\\troot /var/www/html;\\n\\tindex index.html;\\n\\tserver {\\n\\t\\tlisten 80;\\n\\t\\tlocation /redirect_me {\\n\\t\\t\\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\\n\\t\\t}\\n\\t}\\n}\\nevents {\\n}" | sudo tee /etc/nginx/nginx.conf;sudo service nginx restart',
}
