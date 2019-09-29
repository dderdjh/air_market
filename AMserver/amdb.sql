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
  img_url VARCHAR(128)                   #图片路径 
);

#建立购物车列表
CREATE TABLE am_cart(
  cid INT PRIMARY KEY AUTO_INCREMENT, 
  gid INT,                               #商品编号
  title VARCHAR(128),                    #商品标题
  price DECIMAL(10,2),                   #商品价格
  amount INT,                            #购买数量
  img_url VARCHAR(128)                   #商品图片
);

/*********导入数据**********************************************************/

/**气体家族**/
INSERT INTO am_family VALUES
(NULL,"氧气"),
(NULL,"古空气"),
(NULL,"其他气体"),
(NULL,"神秘气体");

/**气体表**/
INSERT INTO am_gas VALUES
(NULL,1,"普通氧气","最一般的氧气满足日常需求",100,"氧气","最普通的氧气,无添加营养成分,仅满足日常生理需求.便宜且深受公民喜爱.",0,"img/10.jpg"),
(NULL,1,"中级氧气","满足日常需求,同时加强吸入时的享受",300,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/24.jpg"),
(NULL,1,"高级氧气","不仅满足需求,还把吸气带入高级体验",800,"氧气","高级氧气,无添加营养成分,有钱人的氧气选择.高等公民用气.",0,"img/20.jpg"),
(NULL,1,"特级氧气","美妙的体验,必须试一次",1000,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/20.jpg"),
(NULL,1,"特级氧气","美妙的体验,必须试一次,就停不下来",2000,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/14.jpg"),
(NULL,1,"预约级氧气","根据你的需要特殊调配",550,"氧气","根据你的需求,特别调配的氧气,出货量少.",0,"img/14.jpg"),
(NULL,1,"预约级氧气","根据你的需要特殊调配",698,"氧气","根据你的需求,特别调配的氧气,出货量少.",0,"img/14.jpg"),
(NULL,1,"专属级氧气","对你专属供应",311,"氧气","对个人专属调配的空气,每轮定期供应",0,"img/24.jpg"),
(NULL,1,"高级氧气","不仅满足需求,还把吸气带入高级体验",800,"氧气","高级氧气,无添加营养成分,有钱人的氧气选择.高等公民用气.",0,"img/20.jpg"),
(NULL,1,"普通氧气","最一般的氧气满足日常需求",100,"氧气","最普通的氧气,无添加营养成分,仅满足日常生理需求.便宜且深受公民喜爱.",0,"img/10.jpg"),
(NULL,1,"中级氧气","满足日常需求,同时加强吸入时的享受",300,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/24.jpg"),
(NULL,1,"高级氧气","不仅满足需求,还把吸气带入高级体验",800,"氧气","高级氧气,无添加营养成分,有钱人的氧气选择.高等公民用气.",0,"img/20.jpg"),
(NULL,1,"特级氧气","美妙的体验,必须试一次",1000,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/20.jpg"),
(NULL,1,"特级氧气","美妙的体验,必须试一次,就停不下来",2000,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/14.jpg"),
(NULL,1,"专属级氧气","对你专属供应",333,"氧气","中级氧气,无添加营养成分,加强吸入体验.是很好的廉价上瘾气体.",0,"img/14.jpg"),
(NULL,1,"神秘氧气","你猜不到是什么,你也不想猜",1000,"古空气","神秘的你都不敢买",0,"img/20.jpg"),
(NULL,2,"2019年普空气","2019年某地的空气",1000,"古空气","古董空气,尝试古老的味道,由我们的员工从2019年带回来的.",0,"img/1.jpg"),
(NULL,2,"2000年普空气","2000年某地的空气",6000,"古空气","古董空气,尝试古老的味道,由我们的员工从2000年带回来的.",0,"img/2.jpg"),
(NULL,2,"1957年普空气","1957年某地的空气",2000,"古空气","古董空气,尝试古老的味道,由我们的员工从1957年带回来的.",0,"img/6.jpg"),
(NULL,2,"1887年普空气","1887年某地的空气",2000,"古空气","古董空气,尝试古老的味道,由我们的员工从1887年带回来的.",0,"img/6.jpg"),
(NULL,2,"1949年开国空气","开国大典天安门上的空气",7000,"古空气","享受和毛主席呼吸同样空气的感觉",0,"img/4.jpg"),
(NULL,2,"1987年普空气","某处大古空气",10000,"古空气","和饥荒的人民呼吸同样的空气,感受当时他们的焦虑",0,"img/2.jpg"),
(NULL,2,"1300年古空气","你从来没试过的的远古带空气",20000,"古空气","远古空气,感受1000多年前人民所呼吸的气味",0,"img/1.jpg"),
(NULL,2,"1500年古空气","你从来没试过的的远古带空气",10000,"古空气","远古空气,感受1000多年前人民所呼吸的气味",0,"img/6.jpg"),
(NULL,2,"1480年古空气","你从来没试过的的远古带空气",20000,"古空气","远古空气,感受1000多年前人民所呼吸的气味",0,"img/2.jpg"),
(NULL,2,"1260年古空气","你从来没试过的的远古带空气",40000,"古空气","远古空气,感受1000多年前人民所呼吸的气味",0,"img/4.jpg"),
(NULL,2,"1160年古空气","你从来没试过的的远古带空气",30000,"古空气","远古空气,感受1000多年前人民所呼吸的气味",0,"img/30.jpg"),
(NULL,2,"500年远古空气","你从来没试过的的远古带空气",50200,"古空气","地球尚未有人类踏足,那时的空气会是怎么样的呢",0,"img/1.jpg"),
(NULL,2,"300年远古空气","你从来没试过的的远古带空气",50000,"古空气","地球尚未有人类踏足,那时的空气会是怎么样的呢",0,"img/2.jpg"),
(NULL,2,"800年远古空气","你从来没试过的的远古带空气",53300,"古空气","地球尚未有人类踏足,那时的空气会是怎么样的呢",0,"img/6.jpg"),
(NULL,2,"300年远古空气","你从来没试过的的远古带空气",50000,"古空气","地球尚未有人类踏足,那时的空气会是怎么样的呢",0,"img/4.jpg"),
(NULL,2,"地球初始空气","尝试地球初成时的空气",50000,"古空气","你不会知道当地球初成时是什么样子",0,"img/1.jpg"),
(NULL,2,"地球初始空气","尝试地球初成时的空气",52000,"古空气","你不会知道当地球初成时是什么样子",0,"img/4.jpg"),
(NULL,2,"地球初始空气","尝试地球初成时的空气",50000,"古空气","你不会知道当地球初成时是什么样子",0,"img/7.jpg"),
(NULL,3,"氮气","实验用氮气",3000,"其他空气","实验用品气体,也可以根据你的需要使用",0,"img/11.jpg"),
(NULL,3,"氢气","实验用氢气",3000,"其他空气","惰性气体、无色无嗅无毒易燃易爆气体，和压缩空气、卤素（溴）、氧化剂、氟气、氯气、氧气、一氧化碳、混合有爆炸危险，氢气与氟气混合就能发生自发性爆炸，与氯气混合光照下也爆炸。接触液氢冻伤，",0,"img/25.jpg"),
(NULL,3,"乙炔","实验用乙炔",3000,"其他空气","避免与氧化剂、酸类、卤素接触。极易燃烧爆炸。",0,"img/15.jpg"),
(NULL,3,"氨气","实验用氨气",3000,"其他空气","氨有毒性2级，在呼吸道有刺激和腐蚀作用，接触高浓度时可引起碱性化学灼伤",0,"img/19.jpg"),
(NULL,3,"氟气","实验用氟气",3000,"其他空气","氟有剧毒与皮肤接触引起毛发燃烧接触部位凝固性坏死。着火时不可将水直接喷射漏气处会助长火势。",0,"img/23.jpg"),
(NULL,3,"甲烷","实验用甲烷",3000,"其他空气","无毒，皮肤接触冻伤。易燃，与空气混合形成爆炸，主要作为燃料，可以用来生产乙炔 、氢气、合成氨、碳黑、硝氯基甲烷、二硫化碳、一氯甲烷、二氯甲烷、三氯甲烷、四氯化碳和氢氰酸等",0,"img/26.jpg"),
(NULL,3,"氖气","实验用氖气",3000,"其他空气","有窒息危险。当作业场所空气中氧气浓度低于18%时，必须佩戴空气呼吸器、氧气呼吸器或长管面具",0,"img/11.jpg"),
(NULL,3,"氪气","实验用氪气",3000,"其他空气","氪气是稀有气体，无色、无味、无毒、惰性，氪气集中存在于大气中.",0,"img/15.jpg"),
(NULL,3,"氙气","实验用氙气",3000,"其他空气","吸入对人的危害与氩相似。吸入混有70%氙气的氧，引起轻度麻醉，约经3分钟即意识丧失",0,"img/25.jpg"),
(NULL,3,"氡气","实验用氡气",3000,"其他空气","19种主要致癌物质之一, 氡的生物学效应主要集中在呼吸道肿瘤、肺纤维化、肺气肿和寿命减少方面",0,"img/23.jpg"),
(NULL,3,"丙烷","实验用丙烷",3000,"其他空气","易燃气体与空气混合能形成爆炸性混合物与氧化剂接触猛烈反应。气体比空气重，能在较低处扩散到相当远的地方",0,"img/29.jpg"),
(NULL,3,"一氧化氮 ","实验用一氧化氮",3000,"其他空气","无色无味有毒气体。与易燃物接触易着火燃烧。接触空气会散发出棕色有酸性氧化性的棕黄色雾。助燃，有毒",0,"img/11.jpg"),
(NULL,3,"氯化氢","实验用氯化氢",3000,"其他空气","无色，空气中不燃烧，有窒息性的气味，对上呼吸道有强刺激，对眼、皮肤、黏膜有腐蚀。",0,"img/26.jpg"),
(NULL,3,"硫化氢","实验用硫化氢",3000,"其他空气","硫化氢是一种易燃的酸性气体，无色，有剧毒。与空气混合能形成爆炸性混合物",0,"img/15.jpg"),
(NULL,3,"二氧化硫","实验用二氧化硫",3000,"其他空气","有毒，不燃。",0,"img/19.jpg"),
(NULL,3,"二氧化硫","实验用二氧化硫",3000,"其他空气","有毒，不燃。",0,"img/15.jpg"),
(NULL,4,"将死之气","巫术用气",4000,"神秘气体","将死之人的最后一口气,用于巫术",0,"img/8.jpg"),
(NULL,4,"特朗普的屁","特殊奇怪气体",6000,"神秘气体","想不到吧,这我们都有",0,"img/13.jpg"),
(NULL,4,"无效之气","能另某种东西无效的气体",36000,"神秘气体","想不到吧,这我们都有",0,"img/17.jpg"),
(NULL,4,"用气","用了才知道的气体",6000,"神秘气体","只有你知道是什么",0,"img/16.jpg"),
(NULL,4,"归源之气","真仙7层之气",16000,"神秘气体","只有修道7层真仙的人才需要用的气",0,"img/28.jpg"),
(NULL,4,"长生气","据说吸入后可以长生",6220,"神秘气体","使用后所有科学医疗对你无效,请谨慎使用",0,"img/13.jpg"),
(NULL,4,"穿越之气","用于给时光机加气",16000,"神秘气体","想不到吧,这我们都有",0,"img/16.jpg"),
(NULL,4,"特朗普的屁","特殊奇怪气体",6000,"神秘气体","想不到吧,这我们都有",0,"img/8.jpg"),
(NULL,4,"贵气","很贵的气",22222,"神秘气体","使贵气环绕,让你感觉很富贵",0,"img/28.jpg"),
(NULL,4,"鬼气","从鬼中提取的高纯度气体",63000,"神秘气体","只有会用的人会用",0,"img/18.jpg"),
(NULL,4,"嗨气","很嗨很嗨很嗨",26000,"神秘气体","嗨到不行的气体,你可以买来嗨一嗨",0,"img/27.jpg"),
(NULL,4,"古白粉气","以前的毒品",16000,"神秘气体","已经对现代人不起作用,不过可以体验一下,不会上瘾",0,"img/17.jpg"),
(NULL,4,"你的气","你自身发出的气体",6000,"神秘气体","需要把你的DNA发送给我们,我们为你制作你的气体",0,"img/8.jpg"),
(NULL,4,"神气","来自天神之气",50000,"神秘气体","没人试过,试过的人都不在人世.",0,"img/13.jpg");