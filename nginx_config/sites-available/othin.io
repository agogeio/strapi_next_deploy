# Nginx Site Config
server {

        index index.html index.htm index.nginx-debian.html;
        server_name othin.io www.othin.io;

        location / {
		root /var/www/othin.io/html;
        }


	# Strapi API and Admin
	location /strapi/ {
		rewrite ^/strapi/?(.*)$ /$1 break;
	        proxy_pass http://localhost:1337;
	        proxy_http_version 1.1;
	        proxy_set_header X-Forwarded-Host $host;
	        proxy_set_header X-Forwarded-Server $host;
	        proxy_set_header X-Real-IP $remote_addr;
	        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	        proxy_set_header X-Forwarded-Proto $scheme;
	        proxy_set_header Host $http_host;
	        proxy_set_header Upgrade $http_upgrade;
	        proxy_set_header Connection "Upgrade";
	        proxy_pass_request_headers on;
	}


	# Nextjs Configuration
	location /nextjs/ {
		rewrite ^/nextjs/?(.*)$ /$1 break;
		proxy_pass http://localhost:3000;
		proxy_http_version 1.1;
	        proxy_set_header X-Forwarded-Host $host;
	        proxy_set_header X-Forwarded-Server $host;
	        proxy_set_header X-Real-IP $remote_addr;
	        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	        proxy_set_header X-Forwarded-Proto $scheme;
	        proxy_set_header Host $http_host;
	        proxy_set_header Upgrade $http_upgrade;
	        proxy_set_header Connection "Upgrade";
	        proxy_pass_request_headers on;
	}



	listen [::]:443 ssl ipv6only=on; # managed by Certbot
	listen 443 ssl; # managed by Certbot
	ssl_certificate /etc/letsencrypt/live/othin.io/fullchain.pem; # managed by Certbot
	ssl_certificate_key /etc/letsencrypt/live/othin.io/privkey.pem; # managed by Certbot
	include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
	ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
	if ($host = www.othin.io) {
		return 301 https://$host$request_uri;
	} # managed by Certbot


	if ($host = othin.io) {
		return 301 https://$host$request_uri;
	} # managed by Certbot

        listen 80;
        listen [::]:80;

        server_name othin.io www.othin.io;
	return 404; # managed by Certbot
}
