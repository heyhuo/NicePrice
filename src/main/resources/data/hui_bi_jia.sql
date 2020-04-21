create database nice_price;
use nice_price;
-- ----商品----
create table goods_info
(
    goods_id    varchar(30) primary key not null COMMENT '电商商品id',
    goods_name  varchar(255) COMMENT '名称',
    price       varchar(9) COMMENT '价格',
    variety     varchar(20) COMMENT '商品种类',
    detail      text COMMENT '详细描述',
    pic_address text COMMENT '图片地址',
    link        text COMMENT '链接',
    plat_form   varchar(20) COMMENT '平台',
    ave_comment varchar(3) COMMENT '评分均值'
) COMMENT ='商品';

# 插入测试
insert into
-- ----用户----
    Create table user_info
(
    user_id int(10) not null primary key auto_increment COMMENT '用户id',
    user_count varchar (11) COMMENT '用户账号',
    user_pwd varchar (30) COMMENT '用户密码'
    ) COMMENT ='用户';

-- ----评价----
Create table comments
(
    user_id       int(10) COMMENT '用户id',
    goods_id      varchar(30) COMMENT '商品id',
    grade_comment varchar(3) COMMENT '评价分值',
    primary key (user_id, goods_id),
    foreign key (user_id) references user_info (user_id),
    foreign key (goods_id) references goods_info (goods_id)
) COMMENT ='评价';

-- ----价格储存----
Create table price_save
(
    goods_id   varchar(30) COMMENT '商品id',
    plat_form  varchar(20) COMMENT '平台',
    price_time datetime COMMENT '价格时间',
    price      varchar(9) COMMENT '价格',
    primary key (goods_id, price_time),
    foreign key (goods_id) references goods_info (goods_id)
) COMMENT ='价格储存';
