
# Wordpress PHP Development Debian Image

I really do not want to setup PHP Development Environment in Windows

## Build

```docker build . -t php-wordpress-knitehias```

## Run

```winpty docker run --rm -it  --mount src="$(pwd)",target=/home/dev/,type=bind -p 80:80 php-wordpress-knitehias```

## Local DNS 

Another my wheel is needed aka  
https://github.com/kooltuoehias/ldnsjacker

## Use

http://wordpress.dev.local/wp-login.php  

Username: wper  

Password: WordpressDevLocal123  

## Source

https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-nginx-mariadb-and-php-on-debian-10  
https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mariadb-php-lemp-stack-on-debian-10  
https://www.digitalocean.com/community/tutorials/how-to-import-and-export-databases-in-mysql-or-mariadb