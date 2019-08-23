DROP database IF EXISTS shopping_category;
create database shopping_category default charset utf8 collate utf8_general_ci;
use shopping_category;

DROP TABLE IF EXISTS category_info;
create table category_info (
cgy_id bigint(11) auto_increment primary key comment '自增id',
p_cgy_id bigint(11) comment '上级id',
title varchar(50) NOT NULL comment '分类名字',
level smallint not null comment '所在等级',
type varchar(100) NOT NULL default '' comment '包含的商品类型，多个类型用“,”分割',
weight int default 10 comment '权重，排序用，默认权重10，权重越小排前头，搜索的时候order by这个',
created datetime NOT NULL default current_timestamp COMMENT '创建时间',
author varchar(50) comment '创建人',
updated datetime COMMENT '最近修改时间',
last_modifier varchar(50) comment '最后修改人category_info'
) comment '分类表';

/*
url: 
localhost/level1/level2/level3
localhost/level1/level2/
localhost/level1/
*/

-- Level 0
INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(0, '顶级分类', '', 'admin', current_timestamp, 'admin', 1, 0);

-- Level 1
INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(1, '数码电器', '', 'admin', current_timestamp, 'admin', 1, 1);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(1, '美妆个护', '', 'admin', current_timestamp, 'admin', 2, 1);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(1, '运动户外', '', 'admin', current_timestamp, 'admin', 3, 1);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(1, '美食天地', '', 'admin', current_timestamp, 'admin', 4, 1);

-- Level 2
INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(2, '电脑办公', '', 'admin', current_timestamp, 'admin', 1, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(2, '移动穿戴', '', 'admin', current_timestamp, 'admin', 2, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(2, '手机数码', '', 'admin', current_timestamp, 'admin', 3, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(2, '外设', '', 'admin', current_timestamp, 'admin', 4, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(3, '化妆用品', '', 'admin', current_timestamp, 'admin', 1, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(3, '洗浴护理', '', 'admin', current_timestamp, 'admin', 2, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(3, '保健品', '', 'admin', current_timestamp, 'admin', 3, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(4, '器材', '', 'admin', current_timestamp, 'admin', 1, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(4, '箱包', '', 'admin', current_timestamp, 'admin', 2, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(4, '鞋子', '', 'admin', current_timestamp, 'admin', 3, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(5, '生鲜', '', 'admin', current_timestamp, 'admin', 1, 2);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(5, '零食', '', 'admin', current_timestamp, 'admin', 2, 2);

-- Level 3
INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(6, '台式', '', 'admin', current_timestamp, 'admin', 1, 3);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`weight`,`level`)
VALUES(6, '笔记本', '', 'admin', current_timestamp, 'admin', 2, 3);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`level`)
VALUES(7, '手环', '', 'admin', current_timestamp, 'admin', 3);

INSERT INTO `shopping_category`.`category_info`(`p_cgy_id`,`title`,`type`,`author`,`updated`,`last_modifier`,`level`)
VALUES(8, '手机', '', 'admin', current_timestamp, 'admin', 3);


/*  查询语句
use shopping_category;

-- Level 0
select cgy.* from category_info cgy where cgy_id=1;

-- Level 1
select cgy.* from category_info cgy where p_cgy_id=1;

-- Level 2
select cgy1.title p_title, cgy2.*
from category_info cgy1
right join category_info cgy2 on cgy1.cgy_id=cgy2.p_cgy_id
where cgy1.p_cgy_id=1;

-- Level 3
select cgy1.title p_p_title,  -- level 1层title
       cgy2.title p_title,   -- level 2层title
       cgy3.*
from category_info cgy1
right join category_info cgy2 on cgy1.cgy_id=cgy2.p_cgy_id
right join category_info cgy3 on cgy2.cgy_id=cgy3.p_cgy_id
where cgy1.p_cgy_id=1;

-- 树状查全部
select 	cgy1.cgy_id p_p_id,  -- level 1层title
		cgy1.title p_p_title,  -- level 1层title
		cgy1.p_cgy_id p_p_per_id,  -- level 1层title
		cgy2.cgy_id p_id,   -- level 2层title
		cgy2.title p_title,   -- level 2层title
		cgy2.p_cgy_id p_per_id,   -- level 2层title
		cgy3.cgy_id id,		
        cgy3.title title,
		cgy3.p_cgy_id per_id
from category_info cgy1
left join category_info cgy2 on cgy1.cgy_id=cgy2.p_cgy_id
left join category_info cgy3 on cgy2.cgy_id=cgy3.p_cgy_id
where cgy1.p_cgy_id=1

-- 权重排序
select cgy.* from category_info cgy 
order by p_cgy_id, weight