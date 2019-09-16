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
#测试数据
INSERT INTO am_login VALUES(null,'a@a.a',md5('123456'));
INSERT INTO am_login VALUES(null,'tom@tom.tom',md5('123456'));
INSERT INTO am_login VALUES(null,'1',md5('1'));

#建立家族列表
CREATE TABLE am_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)                      #家族名称
);

#建立商品表
CREATE TABLE am_gas(
  gid INT PRIMARY KEY AUTO_INCREMENT,
  family_id INT,
  title VARCHAR(128),                    #主标题
  subtitle VARCHAR(128),                 #副标题
  price DECIMAL(10,2),                   #价格
  category VARCHAR(32),                  #所属分类
  details VARCHAR(1024),                 #产品详细说明
  sold_count INT,                        #已售出数量
  img VARCHAR(128)                       #图片路径 
);

/*********导入数据**********************************************************/

/**气体家族**/
INSERT INTO am_family VALUES
(NULL,"氧气"),
(NULL,"古空气"),
(NULL,"其他气体"),
(NULL,"毒气");

/**气体表**/
INSERT INTO am_gas VALUES
(NULL,1,"普通氧气","最一般的氧气满足日常需求",100,"氧气","最普通的氧气,无添加营养成分,仅满足日常生理需求.便宜且深受公民喜爱.",0,"img/10.jpg"),
(NULL,1,"中级氧气","满足日常需求,同时加强吸入时的享受",100,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/14.jpg"),