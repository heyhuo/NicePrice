create database nice_price;
use nice_price;
-- ----商品----
-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info`
(
    `goods_id`    varchar(30) NOT NULL COMMENT '电商商品id',
    `goods_name`  varchar(255) DEFAULT NULL COMMENT '名称',
    `price`       varchar(9)   DEFAULT NULL COMMENT '价格',
    `variety`     varchar(20)  DEFAULT NULL COMMENT '商品种类',
    `tag`         mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci COMMENT '商品标签',
    `detail`      text COMMENT '详细描述',
    `pic_address` text COMMENT '图片地址',
    `link`        text COMMENT '链接',
    `plat_form`   varchar(20)  DEFAULT NULL COMMENT '平台',
    `ave_comment` varchar(3)   DEFAULT NULL COMMENT '评分均值',
    `craw_date`   datetime     DEFAULT NULL COMMENT '爬取时间',
    `month_sale`  int          DEFAULT NULL COMMENT '月销量',
    `comment_num` int          DEFAULT NULL COMMENT '评价数量',
    PRIMARY KEY (`goods_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='商品';

SET FOREIGN_KEY_CHECKS = 1;

# 插入测试
# insert into
-- ----用户----
Create table user_info
(
    user_id    int(10) not null primary key auto_increment COMMENT '用户id',
    user_count varchar(11) COMMENT '用户账号',
    user_pwd   varchar(30) COMMENT '用户密码'
) COMMENT ='用户';

-- ----评价----
-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`
(
    `user_id`       int         NOT NULL COMMENT '用户id',
    `goods_id`      varchar(30) NOT NULL COMMENT '商品id',
    `grade_comment` varchar(3) DEFAULT NULL COMMENT '评价分值',
    PRIMARY KEY (`user_id`, `goods_id`),
    KEY `goods_id` (`goods_id`),
    CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`),
    CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods_info` (`goods_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='评价';

SET FOREIGN_KEY_CHECKS = 1;

-- ----价格储存----
-- ----------------------------
-- Table structure for price_save
-- ----------------------------
DROP TABLE IF EXISTS `price_save`;
CREATE TABLE `price_save`
(
    `goods_id`   varchar(30) NOT NULL COMMENT '商品id',
    `price_time` datetime    NOT NULL COMMENT '价格时间',
    `price`      int                                                    DEFAULT NULL COMMENT '价格',
    `plat_form`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '平台',
    PRIMARY KEY (`goods_id`, `price_time`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='价格储存';

SET FOREIGN_KEY_CHECKS = 1;