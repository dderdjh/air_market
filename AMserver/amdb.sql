SET NAMES UTF8;
DROP DATABASE IF EXISTS am;
CREATE DATABASE am CHARSET=UTF8;
USE am;

#建立login表
CREATE TABLE am_login(
  id INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(50),
  upwd VARCHAR(32)
);

INSERT INTO am_login VALUES(null,'a@a.a',md5('123456'));
INSERT INTO am_login VALUES(null,'tom@tom.tom',md5('123456'));
INSERT INTO am_login VALUES(null,'1',md5('1'));