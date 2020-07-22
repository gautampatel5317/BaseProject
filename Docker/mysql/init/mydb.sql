CREATE DATABASE IF NOT EXISTS `ticketmaster`;
# create root user and grant rights
CREATE USER 'root'@'localhost' IDENTIFIED BY 'Admin@123';
GRANT ALL ON *.* TO 'root'@'%';