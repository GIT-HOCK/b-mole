SET NAMES UTF8;
DROP DATABASE IF EXISTS jhq;
CREATE DATABASE jhq CHARSET=UTF8;
USE jhq;

/**用户信息**/
CREATE TABLE jhq_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);


INSERT INTO jhq_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', '秦小雅', '0');

-- 商品列表
create table jhq_product(
  pid int primary key auto_increment,
  smallImg varchar(1000),
  Img  varchar(100),
  bigImg varchar(32),
  title varchar(100),
  price varchar(32),
  detailsImg varchar(2000),
  color varchar(100),
  detailed varchar(200)
);
insert into jhq_product values
(null,"../../img/product/img-01/smallImg-1-1.png,../../img/product/img-01/smallImg-1-2.png,../../img/product/img-01/smallImg-1-3.png,../../img/product/img-01/smallImg-1-4.png,../../img/product/img-01/smallImg-1-5.png","../../img/product/img-01/img-1.png","../../img/shop/1.png","1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器","￥1288.00","../../img/product/img-01/details-1img-1.png,../../img/product/img-01/details-1img-2.png,../../img/product/img-01/details-1img-3.png,../../img/product/img-01/details-1img-4.png,../../img/product/img-01/details-1img-5.png,../../img/product/img-01/details-1img-6.png,../../img/product/img-01/details-1img-7.png,../../img/product/img-01/details-1img-8.png,../../img/product/img-01/details-1img-9.png,../../img/product/img-01/details-1img-10.png,../../img/product/img-01/details-1img-11.png,../../img/product/img-01/details-1img-12.png,../../img/product/img-01/details-1img-13.png,../../img/product/img-01/details-1img-14.png,../../img/product/img-01/details-1img-15.png,../../img/product/img-01/details-1img-16.png,../../img/product/img-01/details-1img-17.png,../../img/product/img-01/details-1img-18.png,../../img/product/img-01/details-1img-19.png,../../img/product/img-01/details-1img-20.png,../../img/product/img-01/details-1img-21.png,../../img/product/img-01/details-1img-22.png,../../img/product/img-01/details-1img-23.png,../../img/product/img-01/details-1img-24.png,../../img/product/img-01/details-1img-25.png,../../img/product/img-01/details-1img-26.png,../../img/product/img-01/details-1img-27.png,../../img/product/img-01/details-1img-28.png,../../img/product/img-01/details-1img-29.png,../../img/product/img-01/details-1img-30.png,../../img/product/img-01/details-1img-31.png",'黑色,浅蓝色,珍珠白,浅紫色,玫瑰金','净化器x1、操作手册x1、HEPA除尘滤网x1、NCCO纳米氧聚解反应层x1、电源线x1、便携绑带x1 （适用面积为10-20m²）'),
(null,null,null,"../../img/shop/2.png","
b-MOLA 1601家用鱼仔空气净化器除菌甲醛二手烟异味雾霾PM2.5 NCCO技术专利","￥4688.00",null,null,null),
(null,null,null,"../../img/shop/3.png","
b-MOLA1701鱼仔机空气净化器HEPA滤网 家用小型卧室去甲醛苯VOC 母婴杀菌消毒除臭神器 二手烟味雾霾尘埃 配件","￥188.00",null,null,null),
(null,null,null,"../../img/shop/4.png","b-MOLA1701鱼仔空气净化器，母婴空气净化器，去除甲醛苯VOC母婴杀菌消毒，除臭神器家用小型卧室去甲醛空气净化器","2888.00",null,null,null),
(null,null,null,"../../img/shop/5.png","
b-MOLA1702鱼仔空气净化器，家用除臭神器除甲醛甲苯雾霾pm2.5二手烟除菌病毒过敏原","￥4288.00",null,null,null),
(null,null,null,"../../img/shop/6.png","
NCCO1601 Household Air Purifier;Long-Term Use and Cost Effectiveness of NCCO Reactor","￥4688.00",null,null,null),
(null,null,null,"../../img/shop/7.png","亲水性污染物专用配方 HEPA Filter & NCCO Reactor (BMA/BMB/NCCO1701/NCCO1702) FAC01","￥1200.00",null,null,null);

-- 新闻列表
create table jhq_news(
  nid int primary key auto_increment,
  news_img varchar(32),
  news_time varchar(32),
  news_type varchar(32),
  news_title varchar(100)  
);
insert into jhq_news values
(null,"../../img/news/1.jpg","17 七月,2019","产品新闻","掌握这两点甲醛检测仪测量要素，随时了解身边空气质量"),
(null,"../../img/news/2.jpg","10 七月,2019","其他","常见空气污染高危职业，其中有你的吗？"),
(null,"../../img/news/3.jpg","01 七月.2019","其他","空调吹多了会生病？教你10个正确使用空调的小窍门"),
(null,"../../img/news/4.jpg","26 六月.2019","产品新闻","盛夏养生鱼仔空气净化器，教你舒舒服服过夏天！"),
(null,"../../img/news/5.jpg","21 六月.2019","产品新闻","小心！车里这个东西可能诱导白血病等癌症"),
(null,"../../img/news/6.jpg","13 六月.2019","产品新闻","沙尘暴作妖？哼，俺鱼仔空气净化器帮你“吃土”"),
(null,"../../img/news/7.jpg","05 六月.2019","品牌动态","“蓝天保卫战”，没有硝烟，争取赢得每一口好空气"),
(null,"../../img/news/8.jpg","03 六月.2019","其他","防止家里人或邻居抽烟的危害，空气净化器让你减少伤害"),
(null,"../../img/news/9.jpg","31 五月.2019","产品新闻","儿童地垫多数不合格，家长们别掉以轻心了！"),
(null,"../../img/news/10.jpg","23 五月.2019","其他","关于空气净化器，甲醛检测仪及噪音的那些事儿"),
(null,"../../img/news/11.jpg","17 五月.2019","其他","预防鼻炎及缓解鼻炎疼痛，不妨试一试空气净化器"),
(null,"../../img/news/12.jpg","09 五月.2019","其他","空气净化器扫地机器人等这些神器，时刻保护家人健康"),
(null,"../../img/news/13.jpg","08 五月.2019","其他","b-MOLA鱼仔空气净化器：拒绝吃灰的生活，拒绝呼吸“脏空气”"),
(null,"../../img/news/14.jpg","12 四月.2019","其他","空气净化器和新风系统是不是可以二选一"),
(null,"../../img/news/15.jpg","04 四月.2019","其他","清明小长假| 春光正好，走，扫墓踏青去~"),
(null,"../../img/news/16.jpg","28 二月.2019","其他","甲醛检测仪竟比甲醛还可怕，请拒绝再交智商税"),
(null,"../../img/news/17.jpg","29 一月.2019","产品新闻","都市时尚先锋降临，随身空气净化器成为时代新宠！"),
(null,"../../img/news/18.jpg","28 一月.2019","产品新闻","在有暖气的室内，开空气净化器真的安全吗？"),
(null,"../../img/news/19.jpg","16 一月.2019","其他","伦敦真是拿生命在坐地铁，而港铁找到了解决的好办法"),
(null,"../../img/news/20.jpg","20 十二月.2018","其他","室内如何检测空气污染比较靠谱？室内空气质量检测干货！"),
(null,"../../img/news/21.jpg","15 十一月.2018","其他","雾霾围城之下，医学专刊告诉你不戴口罩应看疗效"),
(null,"../../img/news/22.jpg","02 十一月.2018","客户案例","香港顶级学区房会所使用NCCO空气处理系统，空气质量极大提升"),
(null,"../../img/news/23.jpg","28 九月.2018","品牌动态","两周单店23万！b-MOLA鱼仔空气净化器创造沃尔玛销量奇迹"),
(null,"../../img/news/24.jpg","21 九月.2018","其他","肺癌成癌症死亡头号杀手，b-MOLA鱼仔空气净化器成沃尔玛热宠"),
(null,"../../img/news/25.jpg","19 九月.2018","产品新闻","中国制造再一次领先世界，b-MOLA专业除甲醛空气净化器"),
(null,"../../img/news/26.jpg","14 九月.2018","其他","b-MOLA鱼仔空气净化器助力全国经销商酒店行业“好客云”平台"),
(null,"../../img/news/27.jpg","12 九月.2018","产品新闻","宝宝呱呱坠地的第一声啼哭，是对这个世界的污浊空气说“不”"),
(null,"../../img/news/28.jpg","10 九月.2018","品牌动态","沃尔玛，我们来啦！b-MOLA鱼仔空气净化器登陆深圳沃尔玛蛇口店！"),
(null,"../../img/news/29.jpg","05 九月.2018","其他","开学季，孩子吸收的应该是知识，而不是甲醛"),
(null,"../../img/news/30.jpg","31 八月.2018","其他","细思极恐的6个空气污染冷知识，除了致癌连性能力也有影响？"),
(null,"../../img/news/31.jpg","29 八月.2018","品牌动态","香港销量前三的空气净化器b-MOLA即将登陆沃尔玛 打响线下连锁的第一枪"),
(null,"../../img/news/32.jpg","24 八月.2018","品牌动态","喜报！鱼仔空气净化器获德国TÜV 证书，与蜜芽宝贝达成重要战略合作！"),
(null,"../../img/news/33.jpg","22 八月.2018","品牌动态","香港地铁已有30站卫生间使用NCCO技术除臭"),
(null,"../../img/news/34.jpg","20 八月.2018","品牌动态","b-MOLA鱼仔空气净化器祝贺深圳第19届家装节圆满成功"),
(null,"../../img/news/35.jpg","17 八月.2018","品牌动态","b-MOLA鱼仔空气净化器登陆“什么值得买”，获得资深评测专家好评"),
(null,"../../img/news/36.jpg","23 七月.2018","品牌动态","b-MOLA鱼仔空气净化器登陆深圳家装节，这次新家不怕有味了"),
(null,"../../img/news/37.jpg","29 六月.2018","其他","生活中甲醛无处不在，如何避免甲醛的危害"),
(null,"../../img/news/38.jpg","15 六月.2018","其他","哪些地方存在甲醛污染 除甲醛空气净化器受青睐"),
(null,"../../img/news/39.jpg","05 六月.2018","产品新闻","苯污染和甲醛污染一样危害大，如何更有效的去除苯污染技巧"),
(null,"../../img/news/40.jpg","10 十一月.2017","其他","NCCO氧聚解空气净化技术——强势登陆纽约时代广场大屏"),
(null,"../../img/news/41.jpg","10 十一月.2017","产品新闻","NCCO氧聚解空气净化技术：空气传播疫病防治的低调功臣"),
(null,"../../img/news/42.jpg","10 七月.2017","客户案例","香港国际英文幼稚园");
create table cart(
  cid int primary key auto_increment,
  cartDImg varchar(100),
  cartPImg varchar(100),
  cartTitle  varchar(200),
  cartPrice  varchar(32),
  cartNumber int,  
  uid int , 
  foreign key (uid) references jhq_user (uid) 
);
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','1');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','5','1');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','1');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','1');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','1');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','4');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','4');
insert into cart values(null,'../../img/details.png','../../img/66-300x300.png','1802桌面小型迷你空气净化器【网红爆款】抖音同款潮品除臭神器，桌面个人便携式空气净化器 - 浅蓝色','¥ 1288.00','1','4');
