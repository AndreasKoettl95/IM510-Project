#!/bin/sh

sudo mysql -e "
DROP DATABASE IM510_Project;
CREATE DATABASE IM510_Project;

CREATE TABLE IM510_Project.topic (
    id INT(20) NOT NULL AUTO_INCREMENT, 
    name VARCHAR(255) NOT NULL, 
    users__id INT(20) NOT NULL, 
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IM510_Project.thread (
    id INT(20) NOT NULL AUTO_INCREMENT, 
    name VARCHAR(255) NOT NULL, 
    users__id INT(20) NOT NULL, 
    topic__id INT(20) NOT NULL, 
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IM510_Project.post (
    id INT(20) NOT NULL AUTO_INCREMENT,
    text TEXT NOT NULL,
    users__id INT(20) NOT NULL, 
    thread__id INT(20) NOT NULL, 
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IM510_Project.users (
    id INT(20) NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP USER IM510@localhost;
CREATE USER IM510@localhost IDENTIFIED BY 'IM510';

GRANT ALL PRIVILEGES ON IM510_Project.* TO IM510@localhost;"
