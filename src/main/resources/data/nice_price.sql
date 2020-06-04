/*
 Navicat Premium Data Transfer

 Source Server         : nice_price
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : nice_price

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 04/06/2020 22:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

-- ----------------------------
-- Records of goods_info
-- ----------------------------
BEGIN;
INSERT INTO `goods_info`
VALUES ('10923110258', '序曲或一位诗人心灵的成长:沙发图书馆:文娱读物(威廉华兹华斯;9787301285831;北京大学出版社;59.00) ', '40.10', '图书文娱_', '[]',
        '[{\"品牌\":\"Nike/耐克\",\"货号\":\"892651-010\",\"商品系列\":\"运动生活\",\"尺码\":\"均码\",\"性别\":\"男女通用\",\"户外面料\":\"聚酯纤维\",\"上市时间\":\"2020年夏季\",\"运动户外项目\":\"垂钓 沙滩 自行车越野 徒步 旅游\",\"功能\":\"防风 透气 速干\",\"帽檐款式\":\"大檐\",\"颜色分类\":\"黑色 BV1076-010（王一博同款） 白色 BV1076-100（王一博同款） 白蓝 CI9905-100 白色 CK2758-100 橘色 CI9908-847 黑色 CQ9172-010 白色 CQ9172-100 白色 913011-100 黑色 913011-010 黑色 679421-010 白色 679421-100 藏蓝 AJ5463-451 黑色 CQ9222-010 白色 CQ9222-100 黄色 679421-731 粉红 679421-850 花卉 BV2094-011 军绿 AJ5499-355 橘橙 AJ5499-634 粉色 943092-663 白色 739376-100 花卉 BQ1301-309 淡蓝 892764-336 白色 892764-100\",\"是否商场同款\":\"是\",\"吊牌价\":\"169\"}]',
        'https://img.alicdn.com/bao/uploaded/i1/645427271/O1CN01yobhG923aAODpJ3ug_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616166673993&skuId=4611686634594061897&user_id=645427271&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('13198119646', '费雪 多功能宝宝摇椅新生婴儿摇篮摇椅 婴儿用品躺椅安抚椅 W2811 ', '439.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/773634319/O1CN01Tw9YTX1hm95aZky0d_!!773634319.jpg',
        'https://detail.tmall.com/item.htm?id=13198119646&skuId=4002717690348&user_id=773634319&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 376, 3449);
INSERT INTO `goods_info`
VALUES ('14773507950', '迪卡侬防晒衣男防紫外线透气户外外套防晒薄衫皮肤衣防晒服女QUW ', '99.90', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/352469034/O1CN01VNgIeD2GbceGDuDXx_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=14773507950&skuId=4475997947103&user_id=352469034&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 13000, 67000);
INSERT INTO `goods_info`
VALUES ('16105410156', 'Philips/飞利浦 HU4803/00 ', '569.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/T1wg.kFv8XXXcDRso1_040433.jpg',
        'https://detail.tmall.com/item.htm?id=16105410156&skuId=45222273212&standard=1&user_id=92686194&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 486, 0);
INSERT INTO `goods_info`
VALUES ('16674954823', '羽晨家居床单 床品家纺四件套全棉 纯棉床单纯棉双人纯色提花贡缎 ', '300.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/19017025179852647/T1t3FHFm8dXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=16674954823&skuId=24309373975&user_id=478379017&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 12, 49);
INSERT INTO `goods_info`
VALUES ('19151135654', 'Airmate/艾美特 FSW66T2-5 ', '179.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i6/T1FgpKFptlXXXhev32_043830.jpg',
        'https://detail.tmall.com/item.htm?id=19151135654&skuId=36041729957&user_id=904111764&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1838, 0);
INSERT INTO `goods_info`
VALUES ('19385697629', 'POLISI 专业骑行眼镜 偏光风镜男女户外运动自行车骑行镜可配近视 ', '128.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1721430807/O1CN01ccCUgG1Hpe6By60AO_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=19385697629&skuId=43727793988&user_id=1721430807&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1271, 5327);
INSERT INTO `goods_info`
VALUES ('25088304461', 'Galanz/格兰仕 G70F20CN1L-DG ', '499.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1bsErFVXXXXX4XFXXAhPM.VXX_112730.jpg',
        'https://detail.tmall.com/item.htm?id=25088304461&skuId=33328571021&standard=1&user_id=354239925&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 22000, 0);
INSERT INTO `goods_info`
VALUES ('35283154609', 'Tao家居  美式家纺真丝绣花靠垫套 床上用品 靠背套抱枕套 ', '149.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/TB1r_mwRFXXXXcnXXXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=35283154609&skuId=50257916565&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 10);
INSERT INTO `goods_info`
VALUES ('35284240234', 'Tao家居家纺印度进口儿童披毯空调毛毯小盖毯单人午休午睡棉毯子 ', '109.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1791221334/O1CN01Vx91ST1Lj0tWs6KGp_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=35284240234&skuId=50260968032&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 5, 69);
INSERT INTO `goods_info`
VALUES ('37180568143', '童泰婴儿抱被新生儿四季通用包被宝宝外出抱毯纯棉襁褓春夏季用品 ', '62.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1862349720/O1CN01CAKHWL2LfoLkOVtSP_!!1862349720.jpg',
        'https://detail.tmall.com/item.htm?id=37180568143&skuId=4497253723069&user_id=1862349720&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1574, 6377);
INSERT INTO `goods_info`
VALUES ('37185904534', '童泰礼盒套装婴儿衣服纯棉新生儿礼盒宝宝用品礼品夏季薄 送礼好 ', '106.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1862349720/O1CN018jXdui2LfoJnL1nbs_!!1862349720.jpg',
        'https://detail.tmall.com/item.htm?id=37185904534&skuId=3774697188637&user_id=1862349720&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1840, 5317);
INSERT INTO `goods_info`
VALUES ('37422958903', 'Airmate/艾美特 FBW09T2 ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1CPlgLFXXXXXMapXXR.L.9pXX_041844.jpg',
        'https://detail.tmall.com/item.htm?id=37422958903&skuId=41453298142&standard=1&user_id=901158956&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 939, 0);
INSERT INTO `goods_info`
VALUES ('38235209262', '珠江雪堡白啤 国产听装精酿生鲜白啤酒500ml*24罐整箱装特价包邮 ', '249.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2010839167/O1CN01e9cgmB2HaXKpyzgRR_!!2010839167.jpg',
        'https://detail.tmall.com/item.htm?id=38235209262&skuId=4611686056662597166&user_id=2010839167&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 23, 75);
INSERT INTO `goods_info`
VALUES ('38375019716', '恒源祥家纺 柔软珊瑚绒毛毯/盖毯 字母花保暖加厚毯子 家居推荐 ', '138.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1023181773/O1CN01YTyQsj1Oy4p92JtbU_!!1023181773-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=38375019716&skuId=3415690160252&user_id=1023181773&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 68);
INSERT INTO `goods_info`
VALUES ('39998362282', '新生儿包被纯棉初生婴儿抱被春秋被子夏季薄款产房襁褓巾宝宝用品 ', '49.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2111297425/TB21D4NfeuSBuNjSsplXXbe8pXa-2111297425.jpg',
        'https://detail.tmall.com/item.htm?id=39998362282&skuId=4303325552267&user_id=2111297425&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 13000, 110000);
INSERT INTO `goods_info`
VALUES ('40505713870', '贝喜婴儿洗澡盆新生儿浴盆宝宝用品加厚大号可坐躺小孩儿童沐浴桶 ', '75.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2095302329/O1CN01tyM7Mr1T4izv0GJhg_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=40505713870&skuId=4222051729214&user_id=2095302329&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 5595, 76000);
INSERT INTO `goods_info`
VALUES ('40623173705', '全棉时代初生婴儿抱被宝宝纯棉包被襁褓春夏薄款被子新生儿用品 ', '189.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/430490406/O1CN01lkRINO1ErzOBPcAPm_!!430490406.jpg',
        'https://detail.tmall.com/item.htm?id=40623173705&skuId=4342431955119&user_id=430490406&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 4355, 39000);
INSERT INTO `goods_info`
VALUES ('41343797096', 'Tao家居 比利时进口亚麻回形纹盘绳绣花靠垫套家纺 靠背套抱枕套 ', '205.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1x7irRFXXXXX_XpXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=41343797096&skuId=65206170819&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 9, 11);
INSERT INTO `goods_info`
VALUES ('43146070303', 'Galanz/格兰仕 P70F23P-G5(SO) ', '439.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/TB1A3oUFFXXXXbCaXXXqo60.pXX_103952.jpg',
        'https://detail.tmall.com/item.htm?id=43146070303&skuId=74730486048&standard=1&user_id=2217206260&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 3273, 0);
INSERT INTO `goods_info`
VALUES ('43333512456', '懒妈妈婴儿洗澡盆可坐躺新生儿宝宝浴盆大号小孩儿童幼儿家用用品 ', '158.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1984596063/O1CN01P14xXv1uetvuunh8g_!!1984596063.png',
        'https://detail.tmall.com/item.htm?id=43333512456&skuId=4245965075554&user_id=1984596063&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1010, 7658);
INSERT INTO `goods_info`
VALUES ('43598854907', '迪卡侬防晒服女外套户外风衣防晒皮肤衣防晒衣男防紫外线透气QUW ', '149.90', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/352469034/O1CN01fed3pu2GbceSEHFZv_!!352469034-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=43598854907&skuId=4611686062026242811&user_id=352469034&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 16000, 70000);
INSERT INTO `goods_info`
VALUES ('43755481409', 'AUX/奥克斯 FD-140 ', '89.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/TB1WRLWFVXXXXbPXXXXpEk_9VXX_051526.jpg',
        'https://detail.tmall.com/item.htm?id=43755481409&skuId=4528318206610&standard=1&user_id=1585708990&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 14000, 0);
INSERT INTO `goods_info`
VALUES ('43783779796', '迪卡侬旗舰店裤户外速干裤男夏季薄款登山弹力运动裤休闲裤子QUMM ', '99.80', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/352469034/O1CN01Y0j81S2GbcesFPYhz_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=43783779796&skuId=3984859304647&user_id=352469034&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1130, 6268);
INSERT INTO `goods_info`
VALUES ('43834304404', '欣码QS空白三防热敏不干胶标签纸40mm*30mm 50 60 70食品红酒生鲜条形码生产日期贴纸印刷二维码定做 ', '11.60', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2393143909/TB2u08JbVXXXXX8XXXXXXXXXXXX_!!2393143909.jpg',
        'https://detail.tmall.com/item.htm?id=43834304404&skuId=3277814700441&user_id=2393143909&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 1, 16);
INSERT INTO `goods_info`
VALUES ('44054111190', '云麦好轻Color体脂秤智能体重秤女家用人体秤体脂称精准测脂肪体质电子秤减肥称专业健康减脂可爱女生宿舍小 ', '109.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2314356333/O1CN01sdQ1mU1weYoC7nmkI_!!2314356333.jpg',
        'https://detail.tmall.com/item.htm?id=44054111190&skuId=3810619561564&user_id=2314356333&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1784, 19000);
INSERT INTO `goods_info`
VALUES ('44109059823', 'Airmate/艾美特 FT41R ', '229.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/T1gyZnFA8XXXbU8x3W_023709.jpg',
        'https://detail.tmall.com/item.htm?id=44109059823&skuId=4154204671510&standard=1&user_id=305541559&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 10000, 0);
INSERT INTO `goods_info`
VALUES ('44528998959', '【急速发货 单品包邮】小米米家体重秤体脂秤智能家用婴儿女生宿舍称重健康减肥称精准迷你小型人体电子秤女 ', '59.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1714128138/O1CN014y7ImV29zFmMk1BW4_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=44528998959&skuId=81494237804&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 150000, 160000);
INSERT INTO `goods_info`
VALUES ('44654094327', '阿迪达斯官网 DAROGA PLUS CANVAS 男女户外运动鞋B44328EF8999 ', '364.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/446338500/O1CN01HpkkPV2Cf39siZoTA_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=44654094327&skuId=4441485626643&user_id=446338500&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 694, 4346);
INSERT INTO `goods_info`
VALUES ('44880575532', '小哈伦婴儿洗澡盆宝宝浴盆可坐躺新生儿用品大号儿童小孩浴桶初生 ', '49.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2453993970/O1CN01cr7w9X1fCIxOmLIim_!!2453993970.jpg',
        'https://detail.tmall.com/item.htm?id=44880575532&skuId=4495858807800&user_id=2453993970&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1626, 22000);
INSERT INTO `goods_info`
VALUES ('45110757424', '莱宝鲜啤酒 精酿手工皮尔森黄啤650ml*3 Reberg不锈钢瓶生鲜啤酒 ', '158.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2349066398/TB2sss2dcnI8KJjSsziXXb8QpXa_!!2349066398.jpg',
        'https://detail.tmall.com/item.htm?id=45110757424&skuId=4611686063538145328&user_id=2349066398&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 43, 87);
INSERT INTO `goods_info`
VALUES ('45282421151', 'Philips/飞利浦 FC6152 ', '249.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/TB1ehE3HpXXXXX_XpXXiJ1l.FXX_105754.jpg',
        'https://detail.tmall.com/item.htm?id=45282421151&skuId=90307671700&standard=1&user_id=92686194&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 452, 0);
INSERT INTO `goods_info`
VALUES ('45316568078', '婴儿洗澡盆宝宝浴盆用品新生幼儿家用大号加厚可坐可躺儿童洗澡桶 ', '55.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2454628431/O1CN01rHq3V72C9RoPCav5q_!!2454628431.jpg',
        'https://detail.tmall.com/item.htm?id=45316568078&skuId=3947059708358&user_id=2454628431&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 5612, 51000);
INSERT INTO `goods_info`
VALUES ('45695524884', '富安娜家纺家居拖鞋男女拖鞋卧室居家日式家居鞋子夏天夏季室内拖 ', '39.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/268691146/O1CN01Sbwjx61KKuUQEliZz_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=45695524884&skuId=4488707370983&user_id=268691146&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 351, 9067);
INSERT INTO `goods_info`
VALUES ('520679240876', '云麦好轻mini2智能体脂秤专业精准家用体重秤usb充电人体秤测脂肪电子秤体脂称减肥仪女生体质健康秤 ', '89.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2314356333/O1CN01yaxQCe1weYrEODzTT_!!2314356333.jpg',
        'https://detail.tmall.com/item.htm?id=520679240876&skuId=4081815674405&user_id=2314356333&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 31000, 130000);
INSERT INTO `goods_info`
VALUES ('520699935698', 'Joyoung/九阳 SN10L03A ', '88.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/11668030237444079/T1aSwLXhXeXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=520699935698&skuId=3103290686773&standard=1&user_id=2587351960&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 4787, 0);
INSERT INTO `goods_info`
VALUES ('520705791778', '森森水族温度计养鱼液晶水温计热带鱼电子水温仪器鱼缸水族箱测温 ', '19.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2090072497/TB1AImyLpXXXXbQXFXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=520705791778&skuId=3129743232263&user_id=2090072497&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1343, 8831);
INSERT INTO `goods_info`
VALUES ('520946493794', '婴儿抱被新生儿包被夏季薄款初生宝宝用品被子春秋包裹巾产房包被 ', '49.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2096790679/O1CN01aNnGq51Gt1ViCM20R_!!2096790679.jpg',
        'https://detail.tmall.com/item.htm?id=520946493794&skuId=4175441493430&user_id=2096790679&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 3813, 97000);
INSERT INTO `goods_info`
VALUES ('521104619535', '东方万旗红酒牛排1500g家庭套餐生鲜新鲜牛肉10片微调黑椒酱 ', '199.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2539138624/TB2JpGsa_ZRMeJjSspnXXcJdFXa_!!2539138624.jpg',
        'https://detail.tmall.com/item.htm?id=521104619535&skuId=4611686539532007439&user_id=2539138624&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 2);
INSERT INTO `goods_info`
VALUES ('521110886685', '熏马肉生鲜2斤重中国新疆伊犁特产哈萨克族美食佐酒肉食促销包邮 ', '158.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2556490518/TB2bXeqgVXXXXaqXXXXXXXXXXXX_!!2556490518.jpg',
        'https://detail.tmall.com/item.htm?id=521110886685&skuId=4611686539538274589&user_id=2556490518&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 2, 37);
INSERT INTO `goods_info`
VALUES ('521367672160', '乐品 母婴饰品单双面展示柜精品百货家居家纺店展示架宠物店货架 ', '75.60', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1699126267/O1CN01za28sh1wAKk6CwJ2h_!!1699126267-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=521367672160&skuId=3106333735227&user_id=1699126267&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 41, 213);
INSERT INTO `goods_info`
VALUES ('525003508323', '罗卡芙家纺巴洛克风真丝印花男士女士浴袍家居服 ', '1380.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/713275243/O1CN01gRjFtz1obL9fBXDxi_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=525003508323&skuId=4053906221598&user_id=713275243&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 4, 20);
INSERT INTO `goods_info`
VALUES ('525245896040', '罗卡芙家纺 家居用品 欧美风真丝女士家居服睡衣二件套美蒂奇套装 ', '1380.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/713275243/O1CN01Z5uTRK1obL9aWAEKh_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=525245896040&skuId=3843548174164&user_id=713275243&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 4, 6);
INSERT INTO `goods_info`
VALUES ('525360185385', 'Midea/美的 M1-211A ', '359.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/TB1eYfzHXXXXXcSXXXXulWG9FXX_043735.jpg',
        'https://detail.tmall.com/item.htm?id=525360185385&skuId=4413384427512&standard=1&user_id=2616970884&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 22000, 0);
INSERT INTO `goods_info`
VALUES ('526314529051', '日康婴儿洗澡盆新生儿浴盆宝宝用品加厚大号可坐躺小孩儿童沐浴桶 ', '75.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2677373251/O1CN01hPcFCn1Zt0AED336t_!!2677373251.jpg',
        'https://detail.tmall.com/item.htm?id=526314529051&skuId=3920840620764&user_id=2677373251&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 440, 2468);
INSERT INTO `goods_info`
VALUES ('526327321746', '童泰礼盒初生婴儿夏季套装新生儿宝宝夏季满月衣服用品刚出生礼物 ', '159.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1705242754/O1CN01cjPhvG1WDNMf9qFAc_!!1705242754.jpg',
        'https://detail.tmall.com/item.htm?id=526327321746&skuId=3136959699923&user_id=1705242754&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1266, 4695);
INSERT INTO `goods_info`
VALUES ('526938982153', '公牛门铃无线家用超远距离无源开关无线远程电子门铃开关一拖二 ', '109.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/441068731/O1CN01RXNao42EMqeH0SdPi_!!441068731.jpg',
        'https://detail.tmall.com/item.htm?id=526938982153&skuId=4391601734405&user_id=441068731&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1178, 13000);
INSERT INTO `goods_info`
VALUES ('526986352352', '全棉时代婴儿初生纯棉包被抱被外出两用春夏薄款新生儿用品襁褓包 ', '149.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/430490406/O1CN01ACyrs31ErzMGOEcHc_!!430490406.jpg',
        'https://detail.tmall.com/item.htm?id=526986352352&skuId=4142896105539&user_id=430490406&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 3767, 12000);
INSERT INTO `goods_info`
VALUES ('527005506343', 'RED DOUBLE HAPPINESS/红双喜 F16 ', '89.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]',
        '[{\"电源方式\":\"交流电\",\"电风扇品牌\":\"RED DOUBLE HAPPINESS/红双喜\",\"电扇类别\":\"落地扇\",\"型号\":\"F16\",\"申请人名称\":\"佛山市南海多本科技有限公司\",\"能效等级\":\"三级\",\"控制方式\":\"机械式\",\"证书状态\":\"有效\",\"生产企业\":\"红双喜\",\"制造商名称\":\"佛山市南海多本科技有限公司\",\"产品名称\":\"RED DOUBLE HAPPINESS/红...\",\"售后服务\":\"店铺三包\",\"3C产品型号\":\"FS501 500mm 90W; FS45, FS451, FS452, FS453, FS455,...\",\"是否含遥控\":\"无\",\"颜色分类\":\"黑色机械 【四档机械款加长电源线】 【黑色遥控】 【四档遥控款加长电源线】 【四档机械款加长电源线 铝合金扇叶】 【四档遥控款加长电源线 铝合金扇叶】 【七叶款 四档机械款加长电源线】 【七叶款 四档遥控款加长电源线】 【黑色机械】 黑色遥控\",\"最大定时范围\":\"2小时以下\",\"能效备案号\":\"201804-17-5026-2870001952108\",\"证书编号\":\"2010010702395040\",\"智能类型\":\"其他\",\"保修期\":\"24个月\",\"3C规格型号\":\"FS501 500mm 90W;FS45,FS451,FS452,FS453,FS455,FS456...\",\"送风类型\":\"摇头\"}]',
        'https://img.alicdn.com/bao/uploaded/i5/TB1NbefPpXXXXXwaXXX77mO7FXX_011612.jpg',
        'https://detail.tmall.com/item.htm?id=527005506343&skuId=4062054021009&standard=1&user_id=2324642141&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 240000, 0);
INSERT INTO `goods_info`
VALUES ('527550795438', '好孩子婴儿衣服纯棉新生儿礼盒12件装初生儿套装婴儿用品满月礼盒 ', '259.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/379833581/TB2zNo7c4aK.eBjSZFAXXczFXXa_!!379833581.jpg',
        'https://detail.tmall.com/item.htm?id=527550795438&skuId=4027071254318&user_id=379833581&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1110, 6742);
INSERT INTO `goods_info`
VALUES ('534296322191', 'Haier/海尔 MZC-2070M1 ', '329.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i8/TB11ovwJFXXXXXKXVXXZf5S8XXX_020514.jpg',
        'https://detail.tmall.com/item.htm?id=534296322191&skuId=4315831784561&standard=1&user_id=2452406909&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 6288, 0);
INSERT INTO `goods_info`
VALUES ('534986552625', 'Tao家居 Gold Tree 亚麻绣靠垫套 美式家纺亚麻抱枕套靠枕套舒适 ', '99.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB1Qf7MKFXXXXaNXVXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=534986552625&skuId=3192074439709&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 2, 10);
INSERT INTO `goods_info`
VALUES ('535595371521', '小米体脂秤智能体重秤2家用2代女生小型宿舍人体精准专业体质电池婴儿测脂肪健康减肥高精度称重电子称电子秤 ', '58.90', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2755369392/O1CN01flnejq2JFaMyFvtpb_!!2755369392.jpg',
        'https://detail.tmall.com/item.htm?id=535595371521&skuId=3196224646214&user_id=2755369392&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 254, 9703);
INSERT INTO `goods_info`
VALUES ('535969761218', '【清华测脂技术】清华同方体脂称 好体知 体脂秤体重秤体脂称智能精准家用电子秤体质称人体秤健康专业测脂肪 ', '289.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2938397126/O1CN01KirZNh22Vkxl7AF1w_!!2938397126.jpg',
        'https://detail.tmall.com/item.htm?id=535969761218&skuId=3799064585336&user_id=2938397126&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 3774, 32000);
INSERT INTO `goods_info`
VALUES ('536537039970', 'Litfly 磨砂刷套 ', '2.50', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/TB1cfodLXXXXXa2XpXXSKhs9FXX_043117.jpg',
        'https://detail.tmall.com/item.htm?id=536537039970&skuId=3202568251552&user_id=925611061&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 206, 0);
INSERT INTO `goods_info`
VALUES ('536584763504', '门铃无线家用 远距离无线门铃不用电池一拖二拖一电子遥控 呼叫器 ', '19.50', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/737451226/TB2gFPFg_nI8KJjSszbXXb4KFXa_!!737451226.jpg',
        'https://detail.tmall.com/item.htm?id=536584763504&skuId=4293013174209&user_id=737451226&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2548, 45000);
INSERT INTO `goods_info`
VALUES ('537063431096', 'LOVO家纺家居用品袜子男女浅口舒适夏季多彩船型吸湿透气袜子棉袜 ', '9.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/399096865/O1CN01lV43h720aDae1hGGY_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=537063431096&skuId=4243068133865&user_id=399096865&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 129, 277);
INSERT INTO `goods_info`
VALUES ('538704057225', 'Tao家居 Zebra毛巾绣靠垫套 美式家纺毛巾绣花抱枕套斑马纹靠垫套 ', '175.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1xsBeNpXXXXX0apXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=538704057225&skuId=3218545909511&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 7);
INSERT INTO `goods_info`
VALUES ('539527881171', '有品PICOOC智能体脂秤精家用电子称准体重秤健康减肥秤测脂肪mini监测脂肪男女生迷你体质计小型智能体脂仪 ', '89.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3000135118/O1CN01uW4E7a1ng5ZAgs5cI_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=539527881171&skuId=3233215737775&user_id=3000135118&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1082, 5236);
INSERT INTO `goods_info`
VALUES ('540064038081', '有品体脂秤智能精准家用秤体重秤Big人体秤专业健身房小型健康男女生宿舍瘦身picooc婴儿电子称体质称体脂称 ', '119.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2591319573/O1CN01uTr3Dv2KaU5ldXSej_!!2591319573.jpg',
        'https://detail.tmall.com/item.htm?id=540064038081&skuId=3621416555795&user_id=2591319573&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2832, 12000);
INSERT INTO `goods_info`
VALUES ('540120462360', '博洋家纺居家居拖鞋冬男女情侣棉布拖鞋室内防滑日式那女软底拖 ', '49.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/253285776/O1CN01myQKLm1sXSH9XIKP2_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=540120462360&skuId=4246716277230&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 20);
INSERT INTO `goods_info`
VALUES ('540446596603', 'Tao家居 美式家纺毛皮靠垫套 印度进口牛皮皮毛一体靠垫套抱 枕套 ', '999.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1TyKUNVXXXXX0XpXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=540446596603&skuId=3241064469206&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 1);
INSERT INTO `goods_info`
VALUES ('541358455127', 'modomoma婴儿礼盒宝宝衣服套装连体衣哈衣爬服新生儿用品满月送礼 ', '349.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3028530578/O1CN01JCWoX41G8lTCAgI71_!!3028530578.jpg',
        'https://detail.tmall.com/item.htm?id=541358455127&skuId=3780861906130&user_id=3028530578&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 472, 5180);
INSERT INTO `goods_info`
VALUES ('543602932516', '云麦好轻mini2智能体脂秤米家有品精准电子秤专业测脂肪体重秤官方家用成人家庭女宿舍人体减脂称小型便携式 ', '89.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2817607958/TB2OHtnpKuSBuNjy1XcXXcYjFXa_!!2817607958.png',
        'https://detail.tmall.com/item.htm?id=543602932516&skuId=3272220997734&user_id=2817607958&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1543, 4733);
INSERT INTO `goods_info`
VALUES ('544519865237', '迪卡侬跑步运动骑行太阳眼镜男女户外防晒防风马拉松变色墨镜RUNT ', '249.90', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/352469034/O1CN014rn5pA2GbceA2T50O_!!352469034-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=544519865237&skuId=4322036208743&user_id=352469034&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 482, 1580);
INSERT INTO `goods_info`
VALUES ('544640172270', '探路者速干T恤男短袖夏季户外男士运动速干T恤快干透气宽松速干衣 ', '89.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2058862702/O1CN01UnB9s31VpYlhfyobn_!!2058862702.jpg',
        'https://detail.tmall.com/item.htm?id=544640172270&skuId=4488654602182&user_id=2058862702&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1388, 1047);
INSERT INTO `goods_info`
VALUES ('545196490141', 'Gree/格力 KYS-3001B-WG ', '269.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB1Y1kIHpXXXXXcXFXXEEcv9VXX_050914.jpg',
        'https://detail.tmall.com/item.htm?id=545196490141&skuId=3287699668584&standard=1&user_id=3079263591&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1890, 0);
INSERT INTO `goods_info`
VALUES ('545577753036', 'Harbor House 美式休闲家居家纺客厅沙发方形抱枕套绣花靠垫套Ava ', '169.47', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/92668878/O1CN010UxYnn2FSAnoEQHJl_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=545577753036&skuId=3970074223379&user_id=92668878&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 47, 47);
INSERT INTO `goods_info`
VALUES ('545625757444', '【急速发货】小米米家体脂秤体重秤电子秤智能精准电子称女生宿舍迷你蓝牙健康家用体重脂肪秤男女向往的生活 ', '99.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1714128138/O1CN012xFwW329zFhdAFMT3_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=545625757444&skuId=3921590969870&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 88000, 140000);
INSERT INTO `goods_info`
VALUES ('545665782551', 'PVC家具家纺窗帘布艺家居木门木业门窗透明名片设计制作SK00006 ', '60.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB112_PPFXXXXboXpXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=545665782551&skuId=4611686564093170455&user_id=3028244029&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 0);
INSERT INTO `goods_info`
VALUES ('545833603624', 'Airmate/艾美特 FS4066T2-5 ', '179.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/T17iTJFGNaXXagelc8_101416.jpg',
        'https://detail.tmall.com/item.htm?id=545833603624&skuId=3459401539856&standard=1&user_id=3132208140&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1928, 0);
INSERT INTO `goods_info`
VALUES ('546053281413', '卡西欧手表男复古金属小方块防水户外登山运动电子表男ae-1200wh ', '259.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3010760460/O1CN01KKt8Yg1FGin2OuW9G_!!3010760460-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=546053281413&skuId=4320261937410&user_id=3010760460&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 374, 2790);
INSERT INTO `goods_info`
VALUES ('546431021018', '惠谊家纺 家居用品 中国风重磅真丝绣花女士家居服睡衣 ', '499.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/811229945/O1CN01Aep4Mu2NKrTOBKL91_!!811229945.jpg',
        'https://detail.tmall.com/item.htm?id=546431021018&skuId=3466873050602&user_id=811229945&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 2, 33);
INSERT INTO `goods_info`
VALUES ('546544147032', '拓步tsr818骑行眼镜变色偏光防风骑行装备跑步眼镜户外运动近视 ', '198.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1824838104/O1CN01i9AS9P29jgJeXPlNJ_!!1824838104-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=546544147032&skuId=3467750654725&user_id=1824838104&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 348, 2108);
INSERT INTO `goods_info`
VALUES ('547102164938', '博洋家纺沙发席子夏季防滑凉席沙发垫沙发靠垫四季简约家居用品 ', '49.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/253285776/O1CN01DryA5I1sXSH6lIsoP_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=547102164938&skuId=4246689713948&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 13, 92);
INSERT INTO `goods_info`
VALUES ('547396964144', '公牛门铃无线家用不用电池电子遥控门玲超远距离智能门铃一拖二一 ', '79.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3173541077/TB2uVj9uH1YBuNjSszeXXablFXa_!!3173541077.jpg',
        'https://detail.tmall.com/item.htm?id=547396964144&skuId=4038026847904&user_id=3173541077&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 616, 1845);
INSERT INTO `goods_info`
VALUES ('547660723211', 'PVC家具家纺窗帘布艺家居木门木业门窗透明名片设计制作SM00044 ', '75.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB12ZafQpXXXXXOXXXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=547660723211&skuId=4611686566088111115&user_id=3028244029&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 2);
INSERT INTO `goods_info`
VALUES ('548437807723', '子初婴儿隔尿垫可洗纯棉尿垫新生儿用品夏天透气大号超大防水床单 ', '49.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1645898031/O1CN01LKfZxF29CFP6Zdvzg_!!1645898031.jpg',
        'https://detail.tmall.com/item.htm?id=548437807723&skuId=3914971687414&user_id=1645898031&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 5610, 47000);
INSERT INTO `goods_info`
VALUES ('548438037491', 'Tao家居 美式家纺Shimmer色织提花靠垫套 素色工艺沙发靠垫套 ', '139.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB16lhtQVXXXXaZXFXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=548438037491&skuId=3328049516998&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 10);
INSERT INTO `goods_info`
VALUES ('548605537507', '餐饮餐馆超市粮油生鲜渔业龙虾百货酒水名片双面设计制作SL60043 ', '75.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1LsCHQFXXXXXmXXXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=548605537507&skuId=4611686567032925411&user_id=3028244029&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 1);
INSERT INTO `goods_info`
VALUES ('548611924901', '高特马拉松跑步眼镜装备运动防风男女户外太阳镜变色偏光护目墨镜 ', '668.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2023002417/O1CN01FPOHpo1Tj1tHPBF0d_!!2023002417.jpg',
        'https://detail.tmall.com/item.htm?id=548611924901&skuId=4035813129856&user_id=2023002417&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 384, 432);
INSERT INTO `goods_info`
VALUES ('549130920191', 'Gree/格力 FDZ-40X65Bg7 ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1ur4QPVXXXXbXaXXX6KIi9VXX_050810.jpg',
        'https://detail.tmall.com/item.htm?id=549130920191&skuId=4194221010285&standard=1&user_id=838847364&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 2929, 0);
INSERT INTO `goods_info`
VALUES ('549164243394', 'Robam/老板 CXW-200-26A7 ', '2699.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/TB1hbBqQpXXXXaAaXXX4eh5.FXX_105617.jpg',
        'https://detail.tmall.com/item.htm?id=549164243394&skuId=3500684467030&standard=1&user_id=165229494&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 2732, 0);
INSERT INTO `goods_info`
VALUES ('549522962791', 'Fjallraven/北极狐Kanken Mini户外运动包男女双肩背包迷你23561A ', '459.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2041046600/TB2xGtSdXooBKNjSZFPXXXa2XXa_!!2041046600.png',
        'https://detail.tmall.com/item.htm?id=549522962791&skuId=3890129123045&user_id=2041046600&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 123, 1762);
INSERT INTO `goods_info`
VALUES ('549813540858', '公牛门铃远距离一拖二拖一电子遥控门铃无线家用不用电池智能门玲 ', '109.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1691095298/O1CN01O4Abni1p0WtzWHNOk_!!1691095298.jpg',
        'https://detail.tmall.com/item.htm?id=549813540858&skuId=3346722225237&user_id=1691095298&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 345, 20000);
INSERT INTO `goods_info`
VALUES ('549958520508', 'Littleswan/小天鹅 TG100V120WDG ', '2099.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/TB1wkGwQFXXXXckXFXXUmIm_pXX_060015.jpg',
        'https://detail.tmall.com/item.htm?id=549958520508&skuId=3513062635375&standard=1&user_id=1693538412&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 2916, 0);
INSERT INTO `goods_info`
VALUES ('549986063921', 'lovo家纺情侣凉拖鞋家居拖女夏天男士浴室拖JTX238 ', '14.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/279887075/O1CN01YQdeXr228OlKeo0WX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=549986063921&skuId=4325900373410&user_id=279887075&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 2284, 27000);
INSERT INTO `goods_info`
VALUES ('550009617973', '小米体脂秤2米家智能精准成人减肥电子称迷你健康家用脂肪体重秤 ', '98.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2222828811/O1CN01qmX9XJ2ExUFtZJRxR_!!2222828811.jpg',
        'https://detail.tmall.com/item.htm?id=550009617973&skuId=3348455808046&user_id=2222828811&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 665, 476);
INSERT INTO `goods_info`
VALUES ('550987021997', 'ronkids婴儿衣服新生儿礼盒夏套装春秋满月初生礼物宝宝用品大全 ', '328.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3182341057/O1CN01Bh9Xzh1Jg9EHvS6R2_!!3182341057.jpg',
        'https://detail.tmall.com/item.htm?id=550987021997&skuId=4316392876609&user_id=3182341057&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1037, 9721);
INSERT INTO `goods_info`
VALUES ('551121603823', '万隆酱麻鸭*2只 杭州特产酒饭店酱鸭老字号酱板鸭生鲜鸭肉整只 ', '106.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1016948893/TB2.CHWeNPI8KJjSspfXXcCFXXa_!!1016948893.jpg',
        'https://detail.tmall.com/item.htm?id=551121603823&skuId=4611686569548991727&user_id=1016948893&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 34, 582);
INSERT INTO `goods_info`
VALUES ('551329442029', '儿童浴桶大号婴儿浴盆宝宝洗澡盆加厚可坐洗澡桶沐浴桶新生儿用品 ', '64.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2349792237/TB1Y2oWaPihSKJjy0FfXXbGzFXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=551329442029&skuId=3532413863686&user_id=2349792237&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2588, 22000);
INSERT INTO `goods_info`
VALUES ('551473029635', 'lovo家纺夏清凉舒适睡衣女梭织性感蕾丝家居裙JFH172 ', '49.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/279887075/O1CN016p3pV1228OkXZxuoC_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=551473029635&skuId=3998773408303&user_id=279887075&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 4, 61);
INSERT INTO `goods_info`
VALUES ('551884254934', '【天猫U先】多效面膜1片+小样2个*2.5ml舒敏维稳保湿补水修护通投 ', '80.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2298471098/O1CN01zviqQH1JyvTGjzr4M_!!2298471098.jpg',
        'https://detail.tmall.com/item.htm?id=551884254934&skuId=4611686570311642838&user_id=2298471098&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 2, 0);
INSERT INTO `goods_info`
VALUES ('552228661892', 'Bear/小熊 SNJ-B10K1 ', '89.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/TB1OPutPFXXXXX4XVXXMK2L8XXX_020952.jpg',
        'https://detail.tmall.com/item.htm?id=552228661892&skuId=3682298971054&standard=1&user_id=3311248475&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 7923, 0);
INSERT INTO `goods_info`
VALUES ('552410674570', '博洋家纺夏季亚麻拖鞋女男情侣厚底家居家用室内软底防滑四季拖鞋 ', '39.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/253285776/O1CN01GphW7P1sXSH8fiVhL_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=552410674570&skuId=4411527715852&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 58, 248);
INSERT INTO `goods_info`
VALUES ('552634381786', 'eoodoo婴儿衣服新生儿礼盒套装春秋夏季出生满月礼物宝宝用品大全 ', '289.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2832303009/O1CN01l6kzmj1Y6AH5zrl3B_!!2832303009.jpg',
        'https://detail.tmall.com/item.htm?id=552634381786&skuId=4234267765359&user_id=2832303009&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1918, 7418);
INSERT INTO `goods_info`
VALUES ('555119829089', 'Bear/小熊 JSQ-C50Q1 ', '59.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB1uGrPeeL2gK0jSZFmajc7iXXa_083357.jpg',
        'https://detail.tmall.com/item.htm?id=555119829089&skuId=4368495611829&standard=1&user_id=1069640918&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 29000, 0);
INSERT INTO `goods_info`
VALUES ('555127034133', '酒吧奶茶烘焙火锅水果生鲜超市酒店餐饮店铺装饰画墙挂画设计定制 ', '58.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2122995670/O1CN017tAbhd1rkuIAdRgxT_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=555127034133&skuId=4611686573554422037&user_id=2122995670&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 4, 876);
INSERT INTO `goods_info`
VALUES ('555496873285', 'Diamond/钻石 KYT-DS25-3 ', '69.90', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1mXPnD7PoK1RjSZKby4x1IXXa_101856.jpg',
        'https://detail.tmall.com/item.htm?id=555496873285&skuId=4154986843878&standard=1&user_id=3098701717&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 6587, 0);
INSERT INTO `goods_info`
VALUES ('555622764350', '【现货速发 单品包邮】小米体重秤2代家用智能电子称婴儿成人称重精准小巧迷你人体男女 ', '59.00', '电子设备_', '[]',
        '[{\"品牌\":\"Xiaomi/小米\",\"兼容平台\":\"MIUI iOS\",\"功能\":\"体重测量\",\"型号\":\"小米体重秤\",\"颜色分类\":\"体重秤2代\"}]',
        'https://img.alicdn.com/bao/uploaded/i4/2616970884/O1CN011IOuZFIDUvQnEaj_!!2616970884.png',
        'https://detail.tmall.com/item.htm?id=555622764350&skuId=4090543697590&user_id=2616970884&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 20000, 85000);
INSERT INTO `goods_info`
VALUES ('556182033528', '子初婴儿隔尿垫一次性新生宝宝用品防水不可洗夏天透气大小护理垫 ', '102.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2928185390/O1CN01KDDGeH1pgfOTOLjnR_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=556182033528&skuId=4517192731178&user_id=2928185390&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 914, 23000);
INSERT INTO `goods_info`
VALUES ('556778226086', '惠谊家纺 家居用品 中国风女式亲肤天丝家居服睡衣 ', '359.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/811229945/O1CN01MsPlSI2NKrTOBJfdn_!!811229945.jpg',
        'https://detail.tmall.com/item.htm?id=556778226086&skuId=3741991371870&user_id=811229945&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 5);
INSERT INTO `goods_info`
VALUES ('556911907827', '餐饮餐馆水产品生鲜渔业龙虾百货酒水名片设计双面制作SPI00061 ', '60.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3028244029/TB1kyIwSFXXXXaEXXXXXXXXXXXX_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=556911907827&skuId=4611686575339295731&user_id=3028244029&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('557360861695', '水星家纺 慕爱蝶饰暖绒包跟式家居拖鞋情侣拖鞋冬包跟保暖防滑 ', '34.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/688024484/O1CN01vrBTK21iziYWfe08l_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=557360861695&skuId=4521714550489&user_id=688024484&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 2, 39);
INSERT INTO `goods_info`
VALUES ('557464455968', '水星家纺家居拖鞋女可爱室内保暖蝶饰暖绒包跟式家居拖鞋厚底慕爱 ', '59.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/92042735/O1CN01NE2joN1W4fiMa5ih8_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=557464455968&skuId=4225838760472&user_id=92042735&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 6, 1025);
INSERT INTO `goods_info`
VALUES ('558287061800', '大焊电子恒温PPR水管热熔器热熔机pprPE75-110塑焊机合接器热容器 ', '218.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2165854796/O1CN01x0D9eC1lIc5vTSuh6_!!2165854796.jpg',
        'https://detail.tmall.com/item.htm?id=558287061800&skuId=4253061205376&user_id=2165854796&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 393, 1498);
INSERT INTO `goods_info`
VALUES ('558782541111', 'Tao家居 美式家纺Swoon绣花靠垫套 印度手工绣花全棉靠垫套抱枕套 ', '293.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1791221334/TB149KpeMMPMeJjy1XcXXXpppXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=558782541111&skuId=3642574463424&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 8);
INSERT INTO `goods_info`
VALUES ('559192817875', 'Tao家居 美式家纺Reiki 全棉空气层提花欧枕印度进口面料靠垫套 ', '234.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1791221334/TB1M6ncatXXWeJjSZFvXXa6lpXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=559192817875&skuId=3482808504285&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 2);
INSERT INTO `goods_info`
VALUES ('562348204898', 'Huawei/华为智能体脂秤精准监测体重家用运动健康电子秤体脂称 ', '169.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2838892713/O1CN01Is1zMX1Vub7ugClfd_!!2838892713.jpg',
        'https://detail.tmall.com/item.htm?id=562348204898&skuId=4115957273416&user_id=2838892713&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 33000, 160000);
INSERT INTO `goods_info`
VALUES ('562433996489', '【官方正品】华为体脂秤原装wifi家用成人精准智能电子秤荣耀体重秤女男运动健康蓝牙体质称机人体称家庭CH18 ', '119.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2301368431/O1CN018d67ae2C9RpGJnF9d_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=562433996489&skuId=4123280605120&user_id=2301368431&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1501, 12000);
INSERT INTO `goods_info`
VALUES ('563107469776', 'Adidas阿迪达斯帽子男潮女帽夏季户外运动跑步遮阳帽棒球帽鸭舌帽 ', '79.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]',
        '[{\"产地\":\"中国\",\"品牌\":\"Adidas/阿迪达斯\",\"货号\":\"S98151\",\"商品系列\":\"城市户外 生活系列 跑步系列\",\"尺码\":\"均码\",\"性别\":\"男女通用\",\"户外面料\":\"棉 涤纶 聚酯纤维 帆布\",\"上市时间\":\"2020年夏季\",\"运动户外项目\":\"垂钓 沙滩 自行车越野 徒步 旅游\",\"功能\":\"防风 防紫外线 透气 耐磨 保暖 速干 超轻 其他\",\"帽檐款式\":\"大檐\",\"颜色分类\":\"【经典三条杠】白色 DU0197 | 送正品险+运费险 【经典款】白色 FK0899 | 送正品险+运费险 【经典三条杠】黑色 FK0894 | 送正品险+运费险 【经典三条杠】白色 FQ5411 | 送正品险+运费险 ※关注店铺 联系客服有限发货※ 【三叶草】黑色 EC3603 | 送正品险+运费险 【三叶草】白色 FJ2544 | 送正品险+运费险 【三叶草】蓝色 dv0174 | 送正品险+运费险 【三叶草】本命红 FM1324 | 送正品险+运费险 【空顶帽】黑色 FI3026 | 送正品险+运费险 【空顶帽】藏青色 FI3028 | 送正品险+运费险 【空顶帽】白色 FI3029 | 送正品险+运费险 【遮阳升级款】白色 FM3052 | 材质升级 防紫外线 【遮阳升级款】黑色 FM3050 | 材质升级 防紫外线 【遮阳升级款】红色 FM3051 | 材质升级 防紫外线 【遮阳升级款】藏蓝色 FM3054 | 材质升级 防紫外线 【2020新款】白色 fk0885 | 送正品险+运费险 【平沿帽】黑色 CF4869 | 送正品险+运费险 【经典款】白色 S98150 | 送正品险+运费险 【经典款】蓝色 CF6913 | 送正品险+运费险 ※官方正品 假一赔十 送正品险※\",\"是否商场同款\":\"是\",\"吊牌价\":\"79\"}]',
        'https://img.alicdn.com/bao/uploaded/i4/2943098300/O1CN01OAkMXZ2BBRwagElx6_!!2943098300-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=563107469776&skuId=4154985983231&user_id=2943098300&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 9343, 45000);
INSERT INTO `goods_info`
VALUES ('563648454511', '懒妈妈婴儿洗屁屁神器宝宝洗屁股盆新生儿童洗PP洗澡盆用品男女孩 ', '43.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1984596063/TB20JWlsXuWBuNjSspnXXX1NVXa_!!1984596063.jpg',
        'https://detail.tmall.com/item.htm?id=563648454511&skuId=3552802029877&user_id=1984596063&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1082, 5314);
INSERT INTO `goods_info`
VALUES ('563735400384', '公牛门铃家用远距离电子门铃无线家用门铃不用电池一拖一拖二门铃 ', '109.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2106732035/O1CN01gRONRB1Qu4aNA7v93_!!2106732035.jpg',
        'https://detail.tmall.com/item.htm?id=563735400384&skuId=4213013449579&user_id=2106732035&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 435, 1168);
INSERT INTO `goods_info`
VALUES ('563736338387', '维融二维码屏幕扫码器平台收钱付款超市收银医院电子医保刷信用卡支付宝微信花呗语音播报设备扫描枪盒子机器 ', '88.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2173807908/O1CN01YQN9KK28HufJuTb2z_!!2173807908.jpg',
        'https://detail.tmall.com/item.htm?id=563736338387&skuId=3764936062315&user_id=2173807908&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 414, 2899);
INSERT INTO `goods_info`
VALUES ('564199560573', 'Joyoung/九阳 SN-10E92 ', '98.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1AWyonBDH8KJjSszc.RYDTFXa_090939.jpg',
        'https://detail.tmall.com/item.htm?id=564199560573&skuId=3564664577477&standard=1&user_id=2587351960&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1282, 0);
INSERT INTO `goods_info`
VALUES ('564569473974', '新鲜巴戟天 500g  巴戟天  泡酒 巴戟鸡肠风  生鲜 ', '27.44', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2056275262/TB1Iez3otnJ8KJjSszdXXaxuFXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=564569473974&skuId=4611686582996861878&user_id=2056275262&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 11);
INSERT INTO `goods_info`
VALUES ('564765016825', '海得曼自发电门铃无线家用超远距离智能电子遥控玲防水老人呼叫器 ', '58.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1880486526/O1CN01dGXrMU1y4xDpseCI6_!!1880486526.jpg',
        'https://detail.tmall.com/item.htm?id=564765016825&skuId=3973966673442&user_id=1880486526&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 6286, 43000);
INSERT INTO `goods_info`
VALUES ('564779472639', 'dyson/戴森 Dyson V10 Fluffy* ', '3990.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1ggM3mv1TBuNjy0FjThejyXXa_013808.jpg',
        'https://detail.tmall.com/item.htm?id=564779472639&skuId=4326388476648&standard=1&user_id=2089100916&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 700, 0);
INSERT INTO `goods_info`
VALUES ('564906746344', '凯乐石仙女防晒衣男UPF50+防紫外线透气皮肤衣女户外风衣/琥珀 ', '329.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/597385787/O1CN01y8VW9g1scUdIpG33p_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=564906746344&skuId=4150797183844&user_id=597385787&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1883, 1666);
INSERT INTO `goods_info`
VALUES ('564941735394', '公牛门铃无线家用不用电池电子遥控门玲超远距离智能门铃一拖二一 ', '59.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1691095298/O1CN01gEzmjL1p0Wwfn59B8_!!1691095298.jpg',
        'https://detail.tmall.com/item.htm?id=564941735394&skuId=3868485172576&user_id=1691095298&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:38', 2536, 6744);
INSERT INTO `goods_info`
VALUES ('565213881811', 'AUX/奥克斯 FS1605 ', '89.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB11okcaYGYBuNjy0FonGEiBFXa_042736.jpg',
        'https://detail.tmall.com/item.htm?id=565213881811&skuId=4481460366334&user_id=2573931802&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 91000, 0);
INSERT INTO `goods_info`
VALUES ('565263150528', '探路者速干裤男女2020夏季薄款户外运动透气冲锋裤男登山弹力裤子 ', '199.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1696192081/O1CN01PCTASy1RF8oRCSsJc-1696192081.jpg',
        'https://detail.tmall.com/item.htm?id=565263150528&skuId=4488890346179&user_id=1696192081&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1438, 2046);
INSERT INTO `goods_info`
VALUES ('565298096454', 'jeep吉普速干短袖T恤男户外运动体恤衫宽松大码吸汗上衣男冰丝T恤 ', '198.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3310554984/TB1rRW4pKGSBuNjSspbXXciipXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=565298096454&skuId=3814076250083&user_id=3310554984&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 531, 3084);
INSERT INTO `goods_info`
VALUES ('565323038512', '童泰婴儿初生包被夏季薄款全棉婴儿抱被宝宝抱毯包巾新生儿用品 ', '54.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2086995385/O1CN01KZh9yk1peNORVXTk3_!!2086995385.jpg',
        'https://detail.tmall.com/item.htm?id=565323038512&skuId=4294920793352&user_id=2086995385&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2477, 6375);
INSERT INTO `goods_info`
VALUES ('565343663161', 'Gree/格力 FD-4012-WG ', '179.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB19LY7RXXXXXXpapXXPwIz_XXX_053858.jpg',
        'https://detail.tmall.com/item.htm?id=565343663161&skuId=4320936574884&standard=1&user_id=3387420819&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 45000, 0);
INSERT INTO `goods_info`
VALUES ('565388391334', 'jeep吉普夏季男士排汗速干短袖男T恤运动户外透气薄款登山衣大码 ', '139.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3229711804/O1CN011PCGygCqDxY6bVt_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=565388391334&skuId=3629934741651&user_id=3229711804&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 866, 3388);
INSERT INTO `goods_info`
VALUES ('565527937868', '探路者2020新款防晒衣男夏防紫外线衫防晒服超薄透气外套女皮肤衣 ', '219.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1679811590/O1CN01O2Li3o1NcGLPLNfGe_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=565527937868&skuId=4611686583955325772&user_id=1679811590&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 904, 3483);
INSERT INTO `goods_info`
VALUES ('566267285618', '探路者防晒衣女夏季皮肤衣服男2020新款户外薄防紫外线透气运动衫 ', '219.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1696192081/O1CN014orJO31RF8oHYUgHU-1696192081.jpg',
        'https://detail.tmall.com/item.htm?id=566267285618&skuId=4488901866131&user_id=1696192081&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1464, 5725);
INSERT INTO `goods_info`
VALUES ('566296946949', '骆驼男鞋 夏季男士真皮透气户外运动休闲沙滩鞋厚底皮凉鞋潮鞋子 ', '199.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1076417557/O1CN01u87XPu25h9fQTuP3a-1076417557.jpg',
        'https://detail.tmall.com/item.htm?id=566296946949&skuId=4611686584724334853&user_id=1076417557&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 364, 120);
INSERT INTO `goods_info`
VALUES ('567316844871', 'MeiLing/美菱 MFT66-A ', '119.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1mswrhTtYBeNjy1XdIwVXyVXa_040302.jpg',
        'https://detail.tmall.com/item.htm?id=567316844871&skuId=4282208638959&user_id=2969981204&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 160000, 0);
INSERT INTO `goods_info`
VALUES ('567679484453', 'Chigo/志高 FS16 ', '99.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1BR7qaACWBuNjy0FaNf4UlXXa_104407.jpg',
        'https://detail.tmall.com/item.htm?id=567679484453&skuId=3864752739624&user_id=2377407592&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 290000, 0);
INSERT INTO `goods_info`
VALUES ('567878097275', '蹦蹦床健身房家用儿童室内弹跳床户外蹭蹭床成人运动减肥器跳跳床 ', '119.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2175154750/O1CN012c0N4t1kxXttJj3Ds_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=567878097275&skuId=3789850442255&user_id=2175154750&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 17000, 72000);
INSERT INTO `goods_info`
VALUES ('567932625616', '水星家纺硅藻土地垫浴室吸水速干地垫简素然室内脚垫家居用品 ', '99.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/92042735/TB1gPBJdTCWBKNjSZFtXXaC3FXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=567932625616&skuId=4332381028402&user_id=92042735&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 14, 475);
INSERT INTO `goods_info`
VALUES ('568002326624', 'Tao家居  美式家纺Nia真丝绣花靠垫套沙发丝绸面料抱枕套床上用品 ', '399.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1791221334/TB1nnrLmKySBuNjy1zdXXXPxFXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=568002326624&skuId=3790598210951&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 12);
INSERT INTO `goods_info`
VALUES ('568185954006', '美国O2COOL喷雾水杯夏季降温清凉学生运动健身户外便携保冷杯水壶 ', '129.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3873957091/O1CN012MFvCo22Fj6OAcBDR_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=568185954006&skuId=4224217594219&user_id=3873957091&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 470, 3230);
INSERT INTO `goods_info`
VALUES ('568797084124', '小狗 T10 Pro ', '1399.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB1LDFVpXOWBuNjy0Fis7VFxVXa_012228.jpg',
        'https://detail.tmall.com/item.htm?id=568797084124&skuId=3644345124571&standard=1&user_id=306146306&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 5328, 0);
INSERT INTO `goods_info`
VALUES ('568958232091', '博洋家纺夏天男女家用夏凉拖鞋居家室内情侣夏季家居防滑浴室拖鞋 ', '29.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/253285776/O1CN01L6tlLk1sXSHBgpkxl_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=568958232091&skuId=4411548915405&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 7, 179);
INSERT INTO `goods_info`
VALUES ('569180146216', '博洋家纺 夏季拖鞋女情侣加厚底家居软底室内拖鞋时尚四季拖鞋男 ', '29.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/253285776/O1CN01aZEJNc1sXSH7jgmCX_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=569180146216&skuId=4243210084051&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 5, 102);
INSERT INTO `goods_info`
VALUES ('569182892333', '【天猫U先】爆款胶原多效修护面膜1片+小样2个*2.5ml祛痘补水精准 ', '80.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2298471098/O1CN01YvD0851JyvTEXOZGO_!!2298471098.jpg',
        'https://detail.tmall.com/item.htm?id=569182892333&skuId=4611686587610280237&user_id=2298471098&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 1, 0);
INSERT INTO `goods_info`
VALUES ('569262639922', '博洋家纺夏季拖鞋女男加厚底家居家用室内软底防滑简约四季拖鞋 ', '29.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/253285776/O1CN01AQN1Az1sXSH3uwQ6q_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=569262639922&skuId=4246773469619&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 12, 146);
INSERT INTO `goods_info`
VALUES ('569266739577', '博洋家纺 夏季拖鞋女男日式加厚底家居家用室内软底防滑四季拖鞋 ', '39.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/253285776/O1CN01fREgkO1sXSHByKz8z_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=569266739577&skuId=4243191212962&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 9, 137);
INSERT INTO `goods_info`
VALUES ('569267319577', '博洋家纺 夏季拖鞋女男情侣加厚底家居家用室内软底防滑四季拖鞋 ', '39.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/253285776/O1CN01UPWqv31sXSHAKhXVx_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=569267319577&skuId=4413977634474&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 19, 126);
INSERT INTO `goods_info`
VALUES ('569319393861', 'AUX/奥克斯 FD-140R ', '159.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/TB1PsCGqruWBuNjSszgnav8jVXa_113210.jpg',
        'https://detail.tmall.com/item.htm?id=569319393861&skuId=4527585194351&standard=1&user_id=2409607501&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 25000, 0);
INSERT INTO `goods_info`
VALUES ('569331197900', '骆驼登山鞋男防水防滑夏季透气户外运动鞋牛皮厚底耐磨女士徒步鞋 ', '249.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/648476316/O1CN01Nb89pp1wWm9GhTHkN_!!648476316.jpg',
        'https://detail.tmall.com/item.htm?id=569331197900&skuId=3654217025382&user_id=648476316&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 2134, 22000);
INSERT INTO `goods_info`
VALUES ('569395861568', '探路者防晒衣男女夏季户外超薄透气款UPF40+防紫外线外套皮肤服衫 ', '219.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1696192081/O1CN01vDZGWn1RF8oR0yqEw-1696192081.jpg',
        'https://detail.tmall.com/item.htm?id=569395861568&skuId=4611686587823249472&user_id=1696192081&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 3184, 6098);
INSERT INTO `goods_info`
VALUES ('569522949342', '初生婴儿礼盒新生儿衣服套装高档夏季宝宝用品刚出生满月礼物百天 ', '219.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1081624161/O1CN01JpRe0s1gbmbHdHH8j_!!1081624161.jpg',
        'https://detail.tmall.com/item.htm?id=569522949342&skuId=4289105057507&user_id=1081624161&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2533, 8703);
INSERT INTO `goods_info`
VALUES ('569533296023', '婴儿防惊跳襁褓包巾睡袋夏季薄款初生新生宝宝用品防惊吓包被抱被 ', '69.80', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3242485320/O1CN01zMzqxI1pAbdS76lxh_!!3242485320.jpg',
        'https://detail.tmall.com/item.htm?id=569533296023&skuId=4487116038671&user_id=3242485320&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 4363, 21000);
INSERT INTO `goods_info`
VALUES ('569815239006', '新生儿礼盒套装纯棉婴儿衣服薄款用品刚出生初生满月夏季宝宝大全 ', '149.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1081624161/O1CN01tWvqUA1gbmcUxkO9J_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=569815239006&skuId=3714962961799&user_id=1081624161&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 17000, 81000);
INSERT INTO `goods_info`
VALUES ('569835591434', '公牛门铃无线家用一拖二超远距离不用电自发电电子老人门铃呼叫器 ', '79.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1776439779/O1CN01xVLTgS2M6pfxAfQJf_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=569835591434&skuId=3661664997294&user_id=1776439779&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 490, 2141);
INSERT INTO `goods_info`
VALUES ('570796413732', '小米手环4NFC版智能手环3代运动计步器心率睡眠监测Redmi学生4代手环5全屏女电子手表男防水复仇者联盟情侣 ', '159.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2755369392/O1CN01IMWi5G2JFaRe8fQxO_!!2755369392.png',
        'https://detail.tmall.com/item.htm?id=570796413732&skuId=4531316047291&user_id=2755369392&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 9006, 26000);
INSERT INTO `goods_info`
VALUES ('571181543486', '小米手环3NFC版防水三代手环4nfc智能运动跑步健康计步器测心率男女多功能蓝牙学生手环安卓苹果情侣电子手表 ', '99.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/831535574/TB2sz.bvx1YBuNjy1zcXXbNcXXa_!!831535574.jpg',
        'https://detail.tmall.com/item.htm?id=571181543486&skuId=4321815689614&user_id=831535574&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1866, 1062);
INSERT INTO `goods_info`
VALUES ('571272418976', 'adidas阿迪达斯帽子男帽女帽鸭舌帽高尔夫户外运动网球棒球太阳帽 ', '65.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/114746002/O1CN01jHIvMd1uCxhOX1pJe_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=571272418976&skuId=4321320437327&user_id=114746002&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1640, 7694);
INSERT INTO `goods_info`
VALUES ('571322074457', 'Adidas阿迪达斯腰包男女多功能大容量户外运动跑步单肩斜跨包胸包 ', '99.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/114746002/O1CN01T2f6561uCxg8JPmpq_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=571322074457&skuId=4356014401427&user_id=114746002&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 2489, 17000);
INSERT INTO `goods_info`
VALUES ('571388811149', '杭州万隆酱麻鸭2只 杭州特产酒饭店酱鸭老字号生鲜鸭肉生制酱板鸭 ', '106.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3931902286/TB2bZ0QhIIrBKNjSZK9XXagoVXa_!!3931902286.jpg',
        'https://detail.tmall.com/item.htm?id=571388811149&skuId=4611686589816199053&user_id=3931902286&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 4);
INSERT INTO `goods_info`
VALUES ('571640784794', '区块链+开启智能新时代 区块链物联网数据人工智能融合技术 供应链医疗教育农业能源慈善智慧城市社交文娱行业应用技术图书籍 ', '46.10', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2780943040/O1CN01pXyk5U1YKMZeVfdQo_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=571640784794&skuId=4611686590068172698&user_id=2780943040&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('571862396458', 'Galanz/格兰仕 G90F25CN3LN-C2(T1) ', '599.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/TB1ENSUa6DpK1RjSZFrDBK78VXa_092105.jpg',
        'https://detail.tmall.com/item.htm?id=571862396458&skuId=3904484576378&standard=1&user_id=354239925&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 7515, 0);
INSERT INTO `goods_info`
VALUES ('572184542414', '宝宝洗澡盆可坐躺婴儿浴盆折叠通用新生儿大号儿童沐浴桶幼儿用品 ', '79.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2411191186/O1CN01NBj65T1KdEHEDiarp_!!2411191186.jpg',
        'https://detail.tmall.com/item.htm?id=572184542414&skuId=3883899699011&user_id=2411191186&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 265, 9657);
INSERT INTO `goods_info`
VALUES ('572307571413', '澳格纳门铃无线家用超远距离无线门铃家用智能门铃一拖二电子门铃 ', '36.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3458332711/O1CN01DJbhNS1VtgIvawEnK_!!3458332711.png',
        'https://detail.tmall.com/item.htm?id=572307571413&skuId=3717484893479&user_id=3458332711&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2524, 9109);
INSERT INTO `goods_info`
VALUES ('572342711855', '德佑婴儿隔尿垫一次性宝宝用品新生防水夏天透气护理垫尿垫不可洗 ', '39.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2940753275/O1CN01dc2ZMX1a3ziLrPMag_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=572342711855&skuId=3742456732462&user_id=2940753275&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1744, 6613);
INSERT INTO `goods_info`
VALUES ('573254868442', '现货 区块链+开启智能新时代 区块链物联网数据人工智能融合技术 供应链医疗教育农业能源慈善智慧城市社交文娱行业应用技术图书籍 ', '45.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2049420857/TB1n678DStYBeNjSspaXXaOOFXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=573254868442&skuId=4611686591682256346&user_id=2049420857&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('573801785292', 'Nike耐克水杯运动水壶男跑步健身篮球户外大容量水瓶女便携杯子 ', '115.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3301096597/O1CN01DEjn8J1ybTRYaZWgR_!!3301096597-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=573801785292&skuId=3748230036725&user_id=3301096597&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 776, 796);
INSERT INTO `goods_info`
VALUES ('574621282864', 'Panasonic/松下 NN-DS59JB ', '3049.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i8/TB1lfW9Gx1YBuNjy1zc1E_NcXXa_034024.jpg',
        'https://detail.tmall.com/item.htm?id=574621282864&skuId=3929076655835&standard=1&user_id=669690917&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 262, 0);
INSERT INTO `goods_info`
VALUES ('574682950422', '尿布纯棉新生婴儿宝宝用品介子隔尿布夏季可水洗尿片全棉纱布尿布 ', '148.80', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2911828315/O1CN01Z3Aads2BIJrQ5dsEI_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=574682950422&skuId=3825280916028&user_id=2911828315&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2455, 7195);
INSERT INTO `goods_info`
VALUES ('574683194133', '【苏宁正品 专业测脂16年】清华同方体脂称 好体知智能体脂秤健康测脂肪电子秤家用体重秤人体质称男女电子称 ', '279.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2616970884/O1CN010fBzze1IOui8tM3Fv_!!2616970884.jpg',
        'https://detail.tmall.com/item.htm?id=574683194133&skuId=4507131515167&user_id=2616970884&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1313, 7574);
INSERT INTO `goods_info`
VALUES ('575054530134', '博洋家纺新品家居鞋软底防滑洗澡浴室拖鞋女夏季居家凉拖鞋男 ', '49.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/253285776/O1CN01DS12bE1sXSHAKgbIE_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=575054530134&skuId=4231455978889&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 35, 396);
INSERT INTO `goods_info`
VALUES ('575114166373', '阿迪达斯单肩包男包女休闲小挎包户外运动包正品肩包adidas斜挎包 ', '89.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2943098300/O1CN01HlwgKZ2BBRvqWakNQ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=575114166373&skuId=4421145126501&user_id=2943098300&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 2342, 6003);
INSERT INTO `goods_info`
VALUES ('575535086402', '蒂爱婴儿洗澡盆宝宝折叠浴盆新生儿童沐浴神器洗澡桶家用用品大号 ', '278.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2139295513/O1CN018o1T1X1qb06LEwNQc_!!2139295513-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=575535086402&skuId=4331186433681&user_id=2139295513&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 8032, 28000);
INSERT INTO `goods_info`
VALUES ('575895726320', '世纪宝贝婴儿洗泡澡盆宝宝折叠沐浴盆新生儿童用品大号游泳桶家用 ', '328.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2104720594/O1CN01DqxZoB1GG5jnwRh1r_!!2104720594.png',
        'https://detail.tmall.com/item.htm?id=575895726320&skuId=4187442734461&user_id=2104720594&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1324, 17000);
INSERT INTO `goods_info`
VALUES ('576474054632', '新生儿礼盒套装纯棉婴儿衣服夏季薄款用品刚出生初生满月宝宝大全 ', '149.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3555532691/O1CN013Sc8821VkWP7mbCjk_!!3555532691.jpg',
        'https://detail.tmall.com/item.htm?id=576474054632&skuId=3795160797939&user_id=3555532691&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 7151, 36000);
INSERT INTO `goods_info`
VALUES ('576622881539', 'ESPRIT家纺美棉条纹纯棉四件套简约美式家居风床品 ', '499.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3081329144/O1CN01h6ZRPq2HQ0E4gyfVW_!!3081329144.jpg',
        'https://detail.tmall.com/item.htm?id=576622881539&skuId=3965713166135&user_id=3081329144&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 9, 98);
INSERT INTO `goods_info`
VALUES ('576672447272', '【3期免息】小米智能门锁青春版活体指纹识别密码锁电子锁家用室内防盗门小米手机米家通用型锁 ', '999.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2616970884/O1CN01xKno5R1IOuh0DxqkJ_!!2-item_pic.png',
        'https://detail.tmall.com/item.htm?id=576672447272&skuId=4357506103610&user_id=2616970884&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1371, 2283);
INSERT INTO `goods_info`
VALUES ('577032236116', '博洋家纺秋冬全棉家居服女纯色长袖套装睡衣可外穿翻领情侣两件套 ', '239.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/253285776/O1CN01R78d7B1sXSH5GVSNV_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=577032236116&skuId=4417005339979&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 3, 12);
INSERT INTO `goods_info`
VALUES ('577043911267', '无线wifi别墅可视对讲门铃智能家用门钟通话电子门禁系统摄像头 ', '966.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1863483646/O1CN01GZT58a1cnueWd2GNa_!!1863483646.jpg',
        'https://detail.tmall.com/item.htm?id=577043911267&skuId=3969081806692&user_id=1863483646&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 144, 305);
INSERT INTO `goods_info`
VALUES ('577234724167', '博洋家纺家居服女全棉薄款甜美套装长袖翻领睡衣两件套宽松休闲 ', '249.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/253285776/O1CN01xk2MWS1sXSH9G8mRX_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=577234724167&skuId=4417092535830&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 2, 13);
INSERT INTO `goods_info`
VALUES ('577315574959', '博洋家纺家居服卡通夏套装女棉短袖睡衣衬衫式两件套居家服套装女 ', '149.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/253285776/O1CN01YqRxVX1sXSH7EUPqw_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=577315574959&skuId=4417079671144&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 10, 19);
INSERT INTO `goods_info`
VALUES ('577699101356', '门铃无线家用智能超远距离电子遥控门玲一拖一拖二老人病人呼叫器 ', '29.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2261196199/TB2csdDbxTpK1RjSZFKXXa2wXXa_!!2261196199.jpg',
        'https://detail.tmall.com/item.htm?id=577699101356&skuId=3820118489528&user_id=2261196199&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 36000, 78000);
INSERT INTO `goods_info`
VALUES ('577785149147', '博洋家纺家居服女两件套春秋睡衣甜美风卡通套装开衫翻领长袖 ', '249.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/253285776/O1CN01Osqizp1sXSHAKg42t_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=577785149147&skuId=4414002290406&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 7);
INSERT INTO `goods_info`
VALUES ('577880430865', '优之大容量水杯男1000ml塑料运动便携健身女大号水壶户外学生杯子 ', '74.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/4105990827/O1CN01zTmefV1Hyo6PmnWxS_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=577880430865&skuId=3983039384160&user_id=4105990827&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 5921, 15000);
INSERT INTO `goods_info`
VALUES ('578011215083', '十月结晶婴儿隔尿垫一次性宝宝护理垫33*45cm新生儿用品20片*8包 ', '109.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/925772082/O1CN01cOeuHi1RFbCwyCpdK_!!925772082.jpg',
        'https://detail.tmall.com/item.htm?id=578011215083&skuId=3821382757193&user_id=925772082&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1531, 5995);
INSERT INTO `goods_info`
VALUES ('578504371719', '正版包邮 周星驰-做人如果没有梦想,跟咸鱼有什么分别 喜剧名人自传文娱明星青春成功励志畅销书籍演员自我修养表演入门课图书 ', '24.80', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2089686546/O1CN01BMmbob1yE7EICpsmg_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=578504371719&skuId=4611686596931759623&user_id=2089686546&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 3);
INSERT INTO `goods_info`
VALUES ('578526231520', '读新闻学文娱体育英语 无 娱乐/休闲英语文教 中国水利水电出版社 正版畅销图书籍 ', '17.60', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2452277136/O1CN01o7L6nd22aKqU9s115_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=578526231520&skuId=4611686596953619424&user_id=2452277136&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('579046674505', '餐饮餐馆超市水果粮油生鲜渔业龙虾百货酒水名片双面设计制作HR00224 ', '75.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3028244029/O1CN011fdKDJ2hIyOVWD1_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=579046674505&skuId=4611686597474062409&user_id=3028244029&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 1);
INSERT INTO `goods_info`
VALUES ('579204135931', '餐饮餐馆超市水果粮油生鲜渔业龙虾百货酒水名片双面设计制作HR00224 ', '62.50', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3284703201/O1CN011ZW6Gsm3IB01kzL_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=579204135931&skuId=4611686597631523835&user_id=3284703201&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 12);
INSERT INTO `goods_info`
VALUES ('579268839796', '【生鲜散装】万隆酱麻鸭 杭州特产酒饭店酱鸭中华老字号酱鸭团购 ', '56.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3931902286/O1CN01JNl28l1Sl1tMRdkIm_!!3931902286.jpg',
        'https://detail.tmall.com/item.htm?id=579268839796&skuId=4611686597696227700&user_id=3931902286&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 2);
INSERT INTO `goods_info`
VALUES ('579391815001', 'LOVO家纺居家卧室简约素色加绒家居拖JTX221 ', '24.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/399096865/O1CN010plzJW20aDagJQMRw_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=579391815001&skuId=4322299292021&user_id=399096865&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 13, 132);
INSERT INTO `goods_info`
VALUES ('580069415793', '蒂爱婴儿洗澡盆宝宝新生儿童折叠浴盆网红沐浴用品神器加厚0-5岁 ', '328.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2139295513/O1CN01UA2oOV1qb04wWyx1l_!!2139295513.jpg',
        'https://detail.tmall.com/item.htm?id=580069415793&skuId=4338835232568&user_id=2139295513&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 4831, 14000);
INSERT INTO `goods_info`
VALUES ('580850835200', 'LOVO家纺软底静音拖鞋女男春秋居家室内夏季家用保暖情侣家居鞋子 ', '34.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/279887075/O1CN01T0tthz228OkZpg8xY_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=580850835200&skuId=4446430502691&user_id=279887075&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 5, 170);
INSERT INTO `goods_info`
VALUES ('582943813208', 'babycare新生婴儿洗澡盆儿童大号可折叠浴盆用品宝宝洗澡盆可坐躺 ', '269.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2275046294/O1CN01REdkWF1wMhR3x2YhY_!!2275046294-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=582943813208&skuId=4420937043483&user_id=2275046294&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 7372, 14000);
INSERT INTO `goods_info`
VALUES ('583662894850', '顶然珹宝自助点餐二维码手机食堂扫码点餐/酒吧点单/火锅店收银机点菜便利店外送-安卓苹果农贸生鲜同城配送/ ', '298.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2128734444/O1CN0154LGHk1ihOhDq51Qf_!!2128734444.jpg',
        'https://detail.tmall.com/item.htm?id=583662894850&skuId=3935834352257&user_id=2128734444&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 90, 368);
INSERT INTO `goods_info`
VALUES ('584001979579', '骆驼防晒衣女外套防紫外线防晒服防晒衫男轻薄透气长袖皮肤衣夏潮 ', '139.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]',
        '[{\"产地\":\"中国\",\"品牌\":\"Camel/骆驼\",\"货号\":\"A0S218138\",\"商品系列\":\"城市户外\",\"价格区间\":\"201-500元\",\"尺码\":\"120 130 140 150 160 170 S M L XL XXL XXXL\",\"衣长\":\"常规\",\"上市时间\":\"2020年夏季\",\"材质\":\"锦纶\",\"适用对象\":\"女\",\"颜色分类\":\"A0S118143，樱花粉，女 A0S118143，淡粉，女 A0S118143，极地白，女 A0S118143，淡紫粉，女 A0S118143，水波蓝，女 A0S118143，淡蓝，女 A0S218138，墨蓝，男 A0S218138，岩石蓝，男 A0S218138，极地白，男 A0S218138，水鸭绿，男 A0S218138，银灰，男 8148，樱花粉，女 7123-1，淡茱萸粉，女 7123-1，岩灰，女 7123-1，白色，女 7123-1，白/黑，女 7122-1，白色，男 7122-1，白色/黑色，男 8147，墨蓝，男 A0S618144，岩石蓝，童装 A0S618144，极地白，童装 A0S618144，樱花粉，童装 A0S218164，白色，男 A0S218164，银灰，男\",\"主要功能\":\"防风 防紫外线 透气 超轻 其他\",\"面料科技\":\"其他\",\"是否商场同款\":\"是\",\"吊牌价\":\"女款：668元 男款：668元\",\"适用季节\":\"春季 秋季 夏季\",\"服装版型\":\"常规\"}]',
        'https://img.alicdn.com/bao/uploaded/i3/648476316/O1CN01IGUmfv1wWm9QRfHnk_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=584001979579&skuId=4297140325104&user_id=648476316&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 19000, 27000);
INSERT INTO `goods_info`
VALUES ('584530517645', '骆驼户外速干裤男夏季薄款宽松运动裤女2020新款透气弹力休闲长裤 ', '169.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/648476316/O1CN01xUma7G1wWm9P5OtG9_!!648476316.jpg',
        'https://detail.tmall.com/item.htm?id=584530517645&skuId=4462990762841&user_id=648476316&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 2293, 6344);
INSERT INTO `goods_info`
VALUES ('584610431169', 'Keep旗舰店收纳式臂包跑步手机包运动散步大容量男女健身训练户外 ', '59.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3619780669/O1CN01Ntr1xY1GoRSF5OnbD_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=584610431169&skuId=3946329869606&user_id=3619780669&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1175, 2285);
INSERT INTO `goods_info`
VALUES ('584930572460', '趣商业 趣玩耍 大文娱时代的商业机会 周雪林 中欧经管图书中欧商业评论精选集 金融市场与管理 中国经济 复旦大学出版社 ', '38.40', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2128806423/O1CN01XIkc981xJmQsG7B7n_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=584930572460&skuId=4611686603357960364&user_id=2128806423&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('584987633462', 'papa爬爬四季棉婴儿礼盒套装新生儿初生用品宝宝内衣送礼0-6个月 ', '209.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/912989324/O1CN01fGATDa2IkRPRxqofp_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=584987633462&skuId=4273139453282&user_id=912989324&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 802, 1624);
INSERT INTO `goods_info`
VALUES ('585157274077', 'Bear/小熊 SNJ-C10P2 ', '139.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/TB1AirfvbrpK1RjSZTE1noWAVXa_104227.jpg',
        'https://detail.tmall.com/item.htm?id=585157274077&skuId=3959507957131&standard=1&user_id=740969168&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 3881, 0);
INSERT INTO `goods_info`
VALUES ('585193664445', '婴儿洗澡盆新生儿用品宝宝浴盆家用加厚大号小孩可坐躺儿童沐浴桶 ', '67.80', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/723317446/O1CN01eddMV124sJb4kkPr7_!!723317446.jpg',
        'https://detail.tmall.com/item.htm?id=585193664445&skuId=3963731348065&user_id=723317446&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1858, 8639);
INSERT INTO `goods_info`
VALUES ('585240210089', '室外健身器材户外小区公园社区广场老年人家用运动体育路径漫步机 ', '460.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2894739711/O1CN01RbciuT2LbggxkQzOJ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=585240210089&skuId=4129643763103&user_id=2894739711&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 487, 2454);
INSERT INTO `goods_info`
VALUES ('585949506408', '趣商业 趣玩耍 大文娱时代的商业机会 周雪林等 著 周雪林,王正翊 编 贸易经济经管、励志 新华书店正版图书籍 复旦大学出版社 ', '30.80', '图书文娱_', '[]',
        '详情', 'https://img.alicdn.com/bao/uploaded/i3/2455124912/O1CN010rC5Tb1m9jy3lGvaH_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=585949506408&skuId=4611686604376894312&user_id=2455124912&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('585952528448', 'TCL TFS35-19DD ', '89.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i6/TB17wYzCXzqK1RjSZFoZzrfcXXa_101429.jpg',
        'https://detail.tmall.com/item.htm?id=585952528448&skuId=4146567222709&standard=1&user_id=2197248067&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 110000, 0);
INSERT INTO `goods_info`
VALUES ('586096059888', '趣商业 趣玩耍 大文娱时代的商业机会 周雪林等 著 周雪林,王正翊 编 国内贸易经济经管、励志 新华书店正版图书籍 ', '30.26', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2987540729/O1CN01lUkmHQ1HFvE17TPDq_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=586096059888&skuId=4611686604523447792&user_id=2987540729&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 1);
INSERT INTO `goods_info`
VALUES ('586498506574', '趣商业 趣玩耍 大文娱时代的商业机会 周雪林 中欧经管图书中欧商业评论精选集 金融市场与管理 中国经济 复旦大学出版社 ', '33.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/722535607/O1CN01Dsg7QJ1rI3GgCiBsh_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=586498506574&skuId=4611686604925894478&user_id=722535607&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('586605977120', '公牛门铃无线家用远距离自发电门铃老人呼叫器一拖一拖二电子门铃 ', '58.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2616970884/O1CN01nri9WK1IOuiIDo5my_!!2616970884.jpg',
        'https://detail.tmall.com/item.htm?id=586605977120&skuId=4480904890967&user_id=2616970884&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1225, 1052);
INSERT INTO `goods_info`
VALUES ('586649187622', '罗卡芙家纺 巴洛克家居搭配黑色真丝绣花小方靠小抱枕 家居休闲毯 ', '798.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/713275243/O1CN01Mc3dnD1obL9gCAPa2_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=586649187622&skuId=3983670545085&user_id=713275243&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 8);
INSERT INTO `goods_info`
VALUES ('586737951516', '运动水杯男大容量健身水壶户外大号塑料杯子便携超大1000ml水瓶女 ', '99.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2384554455/O1CN01brRDj01imR4SrAdvP_!!2384554455-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=586737951516&skuId=4325650066412&user_id=2384554455&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 4577, 780);
INSERT INTO `goods_info`
VALUES ('586946083512', 'Midea/美的 ZAC10B ', '239.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i6/TB1HJiUCSzqK1RjSZFjigvlCFXa_055024.jpg',
        'https://detail.tmall.com/item.htm?id=586946083512&skuId=4490240131917&standard=1&user_id=201749140&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 77000, 0);
INSERT INTO `goods_info`
VALUES ('587027914687', '趣商业 趣玩耍：大文娱时代的商业机会 管理学 企业高级管理 （中欧经管图书·中欧商业评论精选集） 周雪林 等  经济概况 书籍 ', '33.90', '图书文娱_', '[]',
        '详情', 'https://img.alicdn.com/bao/uploaded/i3/379752521/O1CN01gXtRoY1UUeyjcHJt3_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=587027914687&skuId=4611686605455302591&user_id=379752521&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('587045852226', '青麦精酿原浆啤酒桶装小麦白啤酒青岛特产生鲜啤扎啤全麦2L升4斤 ', '28.80', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2200695895371/O1CN011E5ge91pXxrnBJVXz_!!2200695895371.jpg',
        'https://detail.tmall.com/item.htm?id=587045852226&skuId=4403230203189&user_id=2200695895371&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 1258, 4421);
INSERT INTO `goods_info`
VALUES ('587264705180', '蕉下防晒帽女防紫外线夏季沙滩遮阳帽骑车运动户外空顶太阳帽子 ', '179.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]',
        '[{\"人群\":\"通用\",\"品牌\":\"蕉下\",\"货号\":\"BU9408\",\"适用场景\":\"出游\",\"帽顶款式\":\"空顶\",\"适用年龄\":\"15-19周岁 20-24周岁 25-29周岁 30-34周岁 35-39周岁\",\"尺码\":\"可调节\",\"上市时间\":\"2019年春季\",\"适用对象\":\"少年 情侣 青年\",\"帽檐款式\":\"大檐\",\"颜色分类\":\"【经典款】石英粉 【海报款】曜石黑 【经典款】迷彩粉 【经典款】霜草蓝 【经典款】线条蓝 【经典款】珊瑚粉 【经典款】起司黄 【经典款】魅紫色 【经典款】暗夜蓝 【经典款】浅菘蓝 【经典款】山萸紫 【经典款】点翠蓝 【经典款】藤紫色 【海报款】苍山蓝 【亲子海报款】冲浪鲸鱼 【亲子海报款】光球泡泡 【亲子海报款】暖阳黄 【亲子海报款】奶桃粉 【限量款定制礼盒】 【海报款】甜梦橙 【海报款】木槿紫 【固定帽檐款】荞麦色 【固定帽檐款】子夜黑 【固定帽檐款】艾蒿紫\",\"款式细节\":\"其他\",\"是否商场同款\":\"是\",\"风格\":\"休闲\",\"适用季节\":\"夏季 秋季 冬季\",\"款式\":\"遮阳帽\",\"主要材质\":\"其他\",\"檐形\":\"平檐\"}]',
        'https://img.alicdn.com/bao/uploaded/i2/1652864050/O1CN01h98lFM1fmwf3pY8M7_!!1652864050-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=587264705180&skuId=4439117231462&user_id=1652864050&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 55000, 22000);
INSERT INTO `goods_info`
VALUES ('587355833604', '360可视门铃智能对讲监控家用高清防盗门手机远程电子猫眼摄像头 ', '369.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3390614760/O1CN01P4fOG91l27s53xlN4_!!3390614760.jpg',
        'https://detail.tmall.com/item.htm?id=587355833604&skuId=4442147410867&user_id=3390614760&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2739, 5466);
INSERT INTO `goods_info`
VALUES ('587651240833', 'Jeep防紫外线防晒服男士外套衫男超薄透气薄款钓鱼皮肤衣户外冰丝 ', '259.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3256544246/O1CN01S6fR6C1hEiHzJta5v_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=587651240833&skuId=4334474105590&user_id=3256544246&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1496, 2988);
INSERT INTO `goods_info`
VALUES ('587935711360', '【6期免息】小米米家指纹锁智能门锁密码锁家用防盗门电子锁小米10手机NFC开锁米家 ', '1299.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1714128138/O1CN01ahrSSc29zFmOhcUp7_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=587935711360&skuId=4292503940024&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 4770, 19000);
INSERT INTO `goods_info`
VALUES ('587966184650', 'Garmin佳明 Forerunner 245 血氧跑步心率马拉松音乐运动手表旗舰 ', '2880.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3893688120/O1CN01q1DAs429r0eGFLiiw_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=587966184650&skuId=4392546671214&user_id=3893688120&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 814, 2344);
INSERT INTO `goods_info`
VALUES ('588392871700', 'Gree/格力 FD-40X73h5 ', '169.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i6/TB16uSMJjDpK1RjSZFrGcO78VXa_051534.jpg',
        'https://detail.tmall.com/item.htm?id=588392871700&skuId=4175860358446&standard=1&user_id=838847364&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 29000, 0);
INSERT INTO `goods_info`
VALUES ('589026341380', '伊曼黄酒棒冰65g*20支 绍兴产黄酒味雪糕抖音网红冰淇淋冷饮包邮 ', '120.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/4247178839/O1CN01OSlhUr2FAJKbjyBtk_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=589026341380&skuId=4026897289795&user_id=4247178839&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 11, 14);
INSERT INTO `goods_info`
VALUES ('589172246554', '伊曼黄酒棒冰黄酒冰冰 糯米饭黄酒口味棒冰绍兴产雪糕网红棒冰 ', '25.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/4247178839/O1CN016vD4lP2FAJL70aga8_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=589172246554&skuId=4035165504119&user_id=4247178839&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 27, 50);
INSERT INTO `goods_info`
VALUES ('589715238878', '【6期免息】小米智能门锁标准锁体米家指纹密码锁活体指纹识别电子家用室内防盗门手机NFC开锁 ', '1299.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2616970884/O1CN01SAfvHh1IOuhsYxFDC_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=589715238878&skuId=4487345179461&user_id=2616970884&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 936, 5976);
INSERT INTO `goods_info`
VALUES ('589826018289', '华为体脂秤家用成人精准智能电子秤正品荣耀体重秤测脂肪女男运动健康蓝牙体质秤人体称原装体脂称WiFi版 ', '119.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/683348364/O1CN01MAf0ca2BelCUmPsrI_!!683348364.jpg',
        'https://detail.tmall.com/item.htm?id=589826018289&skuId=4436993383284&user_id=683348364&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2267, 5888);
INSERT INTO `goods_info`
VALUES ('590269223619', '婴儿抱被春秋四季通用纯棉用品初生夏季薄款新生的儿两用产房包被 ', '58.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1660459901/O1CN01Rh4Mad2N0hyxeXYxa_!!1660459901.jpg',
        'https://detail.tmall.com/item.htm?id=590269223619&skuId=4307139830394&user_id=1660459901&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 3699, 8438);
INSERT INTO `goods_info`
VALUES ('590479634149', '婴儿洗澡盆折叠初生家用大号幼儿童可坐躺新生小孩用品桶宝宝浴盆 ', '133.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3075311104/O1CN01f3dibZ1K1fqA3vUn6_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=590479634149&skuId=4047076953938&user_id=3075311104&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 8930, 34000);
INSERT INTO `goods_info`
VALUES ('590596170886', '冰克斯精酿原浆啤酒大桶装全麦黄啤酒青岛特产生鲜啤扎啤2L2升4斤 ', '36.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2200616139618/O1CN01JhPYe52Kv5wkkpQpQ_!!2200616139618.jpg',
        'https://detail.tmall.com/item.htm?id=590596170886&skuId=4225383269830&user_id=2200616139618&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 45, 2142);
INSERT INTO `goods_info`
VALUES ('590640974115', '小米米家电子温湿度计Pro监测电子表蓝牙电子家用婴儿房室内高精密钟表 ', '79.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1714128138/O1CN01H3GDqP29zFh97W2tC_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=590640974115&skuId=4216313986106&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 842, 7274);
INSERT INTO `goods_info`
VALUES ('590723522799', 'Midea/美的 SAB40A ', '149.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB1el3eeRLN8KJjSZPhNjs.spXa_033842.jpg',
        'https://detail.tmall.com/item.htm?id=590723522799&skuId=4487197579567&standard=1&user_id=2227226874&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 53000, 0);
INSERT INTO `goods_info`
VALUES ('590725658299', 'Midea/美的 M1-L201B(0) ', '519.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/201749140/O1CN010LTbfd2HOAXAspl2k_!!201749140.jpg',
        'https://detail.tmall.com/item.htm?id=590725658299&skuId=4498471631578&standard=1&user_id=3409867774&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 21000, 0);
INSERT INTO `goods_info`
VALUES ('591140986542', '新生婴儿浴巾纯棉纱布超柔吸水婴儿用品宝宝初生儿童洗澡巾盖毯 ', '69.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2258845085/O1CN01cAuGdn1nQyZyoYI2e_!!2258845085.jpg',
        'https://detail.tmall.com/item.htm?id=591140986542&skuId=4423970011393&user_id=2258845085&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 16000, 20000);
INSERT INTO `goods_info`
VALUES ('591229703901', '崂迈精酿原浆啤酒桶装小麦白啤酒青岛特产生鲜啤扎啤全麦2L2升4斤 ', '36.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3596779519/O1CN01fEbxtx2KBki1IRkSh_!!3596779519.jpg',
        'https://detail.tmall.com/item.htm?id=591229703901&skuId=4611686609657091805&user_id=3596779519&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 53, 788);
INSERT INTO `goods_info`
VALUES ('591321681644', 'Tao家居家纺Hazy Pima棉印花床上用品床单被套纯棉美式简约四件套 ', '1890.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1791221334/O1CN01wfEUgg1Lj0roU1x75_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=591321681644&skuId=4232474891509&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 9);
INSERT INTO `goods_info`
VALUES ('591367070129', '乐扣乐扣Tritan运动水杯女塑料便携户外健身杯子大容量水壶学生男 ', '79.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/91978383/O1CN01vgei4N2BnSonLCp07_!!91978383-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=591367070129&skuId=4061503005466&user_id=91978383&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 6345, 12000);
INSERT INTO `goods_info`
VALUES ('591592693058', '水星家纺 卡戎长绒棉毛巾男女情侣长绒棉毛巾洗脸巾单条家居用品 ', '39.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/92042735/O1CN01sfshEa1W4foHUC03P_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=591592693058&skuId=4339577992571&user_id=92042735&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 62, 472);
INSERT INTO `goods_info`
VALUES ('591617366754', '森马家纺床上四件套 家用1.5米家居小清新被套床单双人床被罩枕套 ', '439.99', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/397341302/O1CN01BJjirq1LUMHIwisoP_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=591617366754&skuId=4392154491422&user_id=397341302&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 40);
INSERT INTO `goods_info`
VALUES ('591668757919', 'dyson戴森V10 Motorhead家用手持式无线吸尘器小型无绳强力大吸力 ', '2799.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2829060891/O1CN01u6lD0p1IS7Ucfsmnf_!!2829060891.jpg',
        'https://detail.tmall.com/item.htm?id=591668757919&skuId=4328253947894&standard=1&user_id=2829060891&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1043, 0);
INSERT INTO `goods_info`
VALUES ('591801704690', '【知识服务】在线课程 美颜小心机 90后必看的精致女神养成记教学 美妆个护达人教学 美容养颜视频教学 杂志铺在线课程 视频 ', '98.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1974617359/O1CN01zH27K924ETER7eOKe_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=591801704690&skuId=4611686610229092594&user_id=1974617359&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('591834175921', '室外健身器材户外小区公园社区运动广场老年人家用体育路径漫步机 ', '450.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3522743247/O1CN01jEWLRw1ZrAb15xwJt_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=591834175921&skuId=4233269226667&user_id=3522743247&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 680, 2956);
INSERT INTO `goods_info`
VALUES ('592024825133', '【知识服务】在线课程 李乐老师教你学：明星感新娘妆 明星造型师秘技视频 美妆个护达人教学 杂志铺在线课程 视频 ', '79.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1974617359/O1CN01ju9e7j24ETEOUgZpQ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=592024825133&skuId=4611686610452213037&user_id=1974617359&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('592142721931', '华为旗下荣耀亲选无线门铃自发电远距离传输电子不用电池一拖一 ', '65.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1114511827/O1CN01VFHLYt1PMoD0hS1xB_!!1114511827.jpg',
        'https://detail.tmall.com/item.htm?id=592142721931&skuId=4426320399702&user_id=1114511827&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2582, 13000);
INSERT INTO `goods_info`
VALUES ('592143436166', '领王 WY　8300 ', '178.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/TB1N4p8cG61gK0jSZFlv5hDKFXa_112959.jpg',
        'https://detail.tmall.com/item.htm?id=592143436166&skuId=4225899041120&user_id=3193196428&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 2737, 0);
INSERT INTO `goods_info`
VALUES ('592497180770', 'Gree/格力 kyt-30X60h5 ', '199.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/TB17gPXSmzqK1RjSZFppXekSXXa_053639.jpg',
        'https://detail.tmall.com/item.htm?id=592497180770&skuId=4254519154764&standard=1&user_id=3283961536&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 3281, 0);
INSERT INTO `goods_info`
VALUES ('592602963299', 'Haier/海尔 FBY4001 ', '159.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1iK4Rb5MnBKNjSZFz38s_qVXa_051627.jpg',
        'https://detail.tmall.com/item.htm?id=592602963299&skuId=4246340650634&standard=1&user_id=2200831246465&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 3740, 0);
INSERT INTO `goods_info`
VALUES ('592610686488', '【知识服务】在线课程 李乐老师教你学：明星感新娘妆 明星造型师秘技视频 美妆个护达人教学 杂志铺在线课程  视频课程 ', '79.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/370051719/O1CN01qCheOT1OZLNJDoIur_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=592610686488&skuId=4611686611038074392&user_id=370051719&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('592644472540', '【现货速发 单品包邮】小米体脂秤2代智能精准家用成人健康称人体测脂肪称电子称智能体重秤迷你秤男女 ', '99.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2616970884/O1CN01XnEZIs1IOudzYAS5K_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=592644472540&skuId=4090564169097&user_id=2616970884&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 13000, 39000);
INSERT INTO `goods_info`
VALUES ('592721463368', 'MIJIA/米家 米家直流变频落地扇 1X ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1714128138/O1CN01HP8qMl29zFhcx65bC_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=592721463368&skuId=4248500662309&user_id=1714128138&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 28000, 0);
INSERT INTO `goods_info`
VALUES ('592783887458', '【知识服务】在线课程 美颜小心机 90后必看的精致女神养成记教学 美妆个护达人教学 美容养颜视频教学 杂志铺在线课程  视频课程 ', '98.00', '美妆个护_', '[]',
        '详情', 'https://img.alicdn.com/bao/uploaded/i4/370051719/O1CN01s3omgF1OZLNLGUAkR_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=592783887458&skuId=4611686611211275362&user_id=370051719&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('592789747661', '贝喜宝宝浴盆婴儿洗澡盆可折叠新生儿用品大号可坐躺小孩儿童浴桶 ', '85.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2095302329/O1CN01ZIihEC1T4izwxSGCp_!!2095302329.jpg',
        'https://detail.tmall.com/item.htm?id=592789747661&skuId=4332173380960&user_id=2095302329&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 4251, 8811);
INSERT INTO `goods_info`
VALUES ('592973630133', 'MJLN 刷网 ', '2.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201195448247/O1CN01v86IlT2AnAsL0cfMP_!!2201195448247.jpg',
        'https://detail.tmall.com/item.htm?id=592973630133&skuId=4372487250193&user_id=2201195448247&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 20, 0);
INSERT INTO `goods_info`
VALUES ('592977454649', 'Xiaomi/小米 米家直流变频落地扇1X ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3077412435/O1CN01ftmWEG1TrGwDaCu4n_!!3077412435.jpg',
        'https://detail.tmall.com/item.htm?id=592977454649&skuId=4347030920978&standard=1&user_id=2616970884&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 3692, 0);
INSERT INTO `goods_info`
VALUES ('593240694781', '漓泉啤酒1998 整箱广西500ml桂林小瓶装纯生鲜啤酒 小度8度离泉听 ', '96.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2991171804/O1CN0149vqZh1PCH1YaeFKW_!!2991171804.jpg',
        'https://detail.tmall.com/item.htm?id=593240694781&skuId=4412268391235&user_id=2991171804&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 18, 131);
INSERT INTO `goods_info`
VALUES ('593276480046', '【6期免息】小米米家智能门锁霸王锁指纹密码锁家用防盗门电子锁小米10手机NFC开锁米家 ', '1599.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1714128138/O1CN01vI8b8029zFmNDFrFo_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=593276480046&skuId=4099037452811&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 853, 1729);
INSERT INTO `goods_info`
VALUES ('593298597961', '【百亿补贴】网易有道翻译笔2.0有道词典笔2.0扫描笔学生英语学习神器中英译翻译器电子英文单词笔点读笔二代 ', '799.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3307033775/O1CN01GSCchF1dkzkQfLflq_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=593298597961&skuId=4503416571281&user_id=3307033775&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 289, 96);
INSERT INTO `goods_info`
VALUES ('593299863948', 'Galanz/格兰仕 P70D20P-N9(W0) ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1KRVCKXXXXXcNXVXXe5ZlFpXX_121906.jpg',
        'https://detail.tmall.com/item.htm?id=593299863948&skuId=4092385909565&standard=1&user_id=2200771962243&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 8584, 0);
INSERT INTO `goods_info`
VALUES ('593411954890', '浮宫杨梅新鲜当季孕妇水果2斤现摘现发应季非仙居东魁杨梅可泡酒 ', '99.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2200814205334/O1CN01iwx0FU1pH1D4brjk5_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=593411954890&skuId=4611686611839342794&user_id=2200814205334&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 293, 111);
INSERT INTO `goods_info`
VALUES ('593623509594', '钻石牌 FC-30L1 ', '115.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201225211583/O1CN01oP66Nm1NZ3UsuD1Wf_!!2201225211583.jpg',
        'https://detail.tmall.com/item.htm?id=593623509594&skuId=4357095684053&user_id=2201225211583&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 17000, 0);
INSERT INTO `goods_info`
VALUES ('593917145625', '卡西欧casio手表男小方块AE-1200WHD户外防水运动男士学生电子表 ', '239.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2200834900098/O1CN014FHzAl1CavPgecQOv_!!2200834900098-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=593917145625&skuId=4274175313772&user_id=2200834900098&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 486, 813);
INSERT INTO `goods_info`
VALUES ('594017426191', '趣商业 趣玩耍 大文娱时代的商业机会 周雪林等 著 周雪林,王正翊 编 商业贸易 经管、励志 复旦大学出版社 正版图书 ', '32.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2890685839/O1CN014fGli71t0J9bokJom_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=594017426191&skuId=4611686612444814095&user_id=2890685839&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('594158975635', 'Littleswan/小天鹅 TT75-S189(C) ', '278.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/T1FeZOFUNaXXXeO4M9_103618.jpg',
        'https://detail.tmall.com/item.htm?id=594158975635&skuId=4107884441207&standard=1&user_id=2201222773750&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 912, 0);
INSERT INTO `goods_info`
VALUES ('595211891254', '骆驼男鞋 休闲男士凉鞋真皮防滑运动凉鞋潮流青年休闲户外沙滩鞋 ', '179.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3907992712/O1CN019j6q4T1Vu8jG52Z3Z_!!3907992712.jpg',
        'https://detail.tmall.com/item.htm?id=595211891254&skuId=4351149630592&user_id=3907992712&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 652, 155);
INSERT INTO `goods_info`
VALUES ('595212019928', '尿布纯棉新生婴儿介子布100%全棉尿戒子宝宝用品纱布尿片纯棉可洗 ', '69.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2258845085/O1CN01ffgQr31nQyari8OzZ_!!2258845085-2-pixelsss.png',
        'https://detail.tmall.com/item.htm?id=595212019928&skuId=4374459271912&user_id=2258845085&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2312, 8766);
INSERT INTO `goods_info`
VALUES ('595587557140', '婴儿抱被新生儿用品宝宝襁褓包巾春夏季薄款纯棉初生抱毯产房包被 ', '49.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2096790679/O1CN01r5IjyL1Gt1VvvcFLj_!!2096790679.jpg',
        'https://detail.tmall.com/item.htm?id=595587557140&skuId=4303314002939&user_id=2096790679&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 3764, 3113);
INSERT INTO `goods_info`
VALUES ('595861180477', '阿迪达斯官网授权男子2020夏季运动休闲鞋溯溪鞋户外涉水鞋FY1784 ', '439.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2397808261/O1CN01kTvm3I2AtaUwfUYtf_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=595861180477&skuId=4509125355373&user_id=2397808261&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 425, 181);
INSERT INTO `goods_info`
VALUES ('596155584482', '【6期免息】小米米家指纹锁智能门锁 推拉式密码锁家用防盗门电子锁指纹锁小米10开锁 ', '1699.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1714128138/O1CN017XH8YW29zFmP91SiN_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=596155584482&skuId=4148083709522&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 2433, 6221);
INSERT INTO `goods_info`
VALUES ('596246838762', '婴儿洗澡盆宝宝折叠浴盆新生幼儿童可坐躺家用大号沐浴桶小孩用品 ', '98.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1990417844/O1CN01BpP14y27obJ8T1IuN_!!1990417844.jpg',
        'https://detail.tmall.com/item.htm?id=596246838762&skuId=4310470770082&user_id=1990417844&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 45000, 66000);
INSERT INTO `goods_info`
VALUES ('596436401468', 'Tao家居 Rotate全棉纯棉提花四件套被套床单美式家纺床上用品 ', '1990.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1791221334/O1CN01bZ6sYb1Lj0t6gHKW7_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=596436401468&skuId=4148640817033&user_id=1791221334&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 1);
INSERT INTO `goods_info`
VALUES ('596908973232', 'AUX/奥克斯 FS1616 ', '89.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2284278682/O1CN012zRp0i2E0PBSIDlME_!!2284278682.jpg',
        'https://detail.tmall.com/item.htm?id=596908973232&skuId=4336496048112&standard=1&user_id=2284278682&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 3445, 0);
INSERT INTO `goods_info`
VALUES ('597631247555', '趣商业 趣玩耍：大文娱时代的商业机会（中欧经管图书·中欧商业评论精选集） ', '35.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1049653664/O1CN01AkgaDE1cw9iw2lxHs_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=597631247555&skuId=4611686616058635459&user_id=1049653664&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('597661546007', 'led显示屏广告屏 定制户外门头滚动走字电子屏成品防雨广告牌全彩 ', '160.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2200695584995/O1CN01E2aNN51mlktAY8yDW_!!2200695584995.jpg',
        'https://detail.tmall.com/item.htm?id=597661546007&skuId=4611686616088933911&user_id=2200695584995&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 799, 981);
INSERT INTO `goods_info`
VALUES ('597678800442', '漓泉1998啤酒 瓶听装整箱小度特酿广西桂林小瓶装纯生鲜灌装8度酒 ', '54.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2991171804/O1CN01KkvaW71PCH2hQuP9h_!!2991171804.jpg',
        'https://detail.tmall.com/item.htm?id=597678800442&skuId=4238440696567&user_id=2991171804&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 60, 279);
INSERT INTO `goods_info`
VALUES ('598167715980', 'Bear/小熊 SNJ-B20T1 ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3305375223/O1CN01BRvR6V1oSBBYRI1GU_!!3305375223.png',
        'https://detail.tmall.com/item.htm?id=598167715980&skuId=4164345617499&standard=1&user_id=3311248475&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 447, 0);
INSERT INTO `goods_info`
VALUES ('598237501677', 'Galanz/格兰仕 G90F23CN3PV-BM1(S2) ', '1099.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2200726291895/O1CN01r3PSBM1Prx5FihhUa_!!2200726291895.png',
        'https://detail.tmall.com/item.htm?id=598237501677&skuId=4170459561665&standard=1&user_id=2200726291895&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 5475, 0);
INSERT INTO `goods_info`
VALUES ('598588636996', 'MIJIA/米家 米家智能除菌加湿器 ', '249.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1714128138/O1CN01TDd5AD29zFjGdcZIi_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=598588636996&skuId=4347738987805&user_id=1714128138&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 6692, 0);
INSERT INTO `goods_info`
VALUES ('598589232247', '【大促！直降50】荣耀智能手环5运动华为4升级款血氧检测多功能心率男女安卓NFC电子手表支付计步器官方正品 ', '129.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1849011275/O1CN01jouowz1LHzX18DlhQ_!!1849011275.jpg',
        'https://detail.tmall.com/item.htm?id=598589232247&skuId=4513390287837&user_id=1849011275&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 378, 269);
INSERT INTO `goods_info`
VALUES ('598622732755', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3322362474/O1CN01atUoy41U98SKys0tG_!!3322362474-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=598622732755&skuId=4611686617050120659&user_id=3322362474&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 1);
INSERT INTO `goods_info`
VALUES ('598622856630', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '71.62', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2455124912/O1CN01X6PSGK1m9k1K2yIzn_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=598622856630&skuId=4611686617050244534&user_id=2455124912&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 4);
INSERT INTO `goods_info`
VALUES ('598623232071', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/660845759/O1CN01K5hXXN1sPfUKitw8o_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=598623232071&skuId=4611686617050619975&user_id=660845759&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('598842546638', '耐克运动腰包女男BA5750户外多功能NIKE斜挎包潮包跑步腰包单肩包 ', '149.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/352183601/O1CN01HxgZZK1cTIpYYgZyK_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=598842546638&skuId=4328909388162&user_id=352183601&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 515, 747);
INSERT INTO `goods_info`
VALUES ('598853505764', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3713444131/O1CN01B6EFH31gO2gzQB6tn_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=598853505764&skuId=4611686617280893668&user_id=3713444131&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('598853649556', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2987540729/O1CN018PgnGD1HFvHEOyRxO_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=598853649556&skuId=4611686617281037460&user_id=2987540729&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 1);
INSERT INTO `goods_info`
VALUES ('598853913870', '实用现代汉语语法(第3版)：刘月华 潘文娱 故韡 著 著 语言－汉语 文教 商务印书馆 正版图书 ', '75.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2890685839/O1CN01x3vAJB1t0JAosNDkY_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=598853913870&skuId=4611686617281301774&user_id=2890685839&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('598959497831', '水果货架展示架自由组合超市蔬菜架多层红酒蛋糕架生鲜货柜展示柜 ', '335.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3311461923/O1CN01p75DK01Q4mEUOKPq6_!!3311461923-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=598959497831&skuId=4262482365456&user_id=3311461923&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 4, 59);
INSERT INTO `goods_info`
VALUES ('599002183093', '【3期免息】小米米家指纹锁智能门锁青春版 指纹密码锁家用防盗门电子锁远程开门 ', '999.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1714128138/O1CN01MeMXBp29zFmP21aCp_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=599002183093&skuId=4463609634509&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 3027, 7310);
INSERT INTO `goods_info`
VALUES ('599047150397', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3386753267/O1CN01FsoW8r1a0KXXfXmEF_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=599047150397&skuId=4611686617474538301&user_id=3386753267&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('599235735894', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3369625823/O1CN01tpQ6981ssypt9QueZ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=599235735894&skuId=4611686617663123798&user_id=3369625823&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('599262635116', '顶然珹宝生鲜蔬菜配送超市下单软件配送自助扫码点餐手机酒吧中餐火锅平板点菜餐饮软件手机支付宝扫码系统 ', '398.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2128734444/O1CN01fHx28e1ihOha1FL5t_!!2128734444.jpg',
        'https://detail.tmall.com/item.htm?id=599262635116&skuId=4178678453990&user_id=2128734444&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 7, 42);
INSERT INTO `goods_info`
VALUES ('599288633172', '有道 网易词典笔2.0 电子词典翻译笔英语学习机2代升级便携扫描阅读电子辞典英汉快速翻译机单词笔整句翻译器 ', '439.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3554920743/O1CN01KrkTN91HMKsNdNHaq_!!3554920743.jpg',
        'https://detail.tmall.com/item.htm?id=599288633172&skuId=4490597358905&user_id=3554920743&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 840, 1232);
INSERT INTO `goods_info`
VALUES ('599376773191', '小米智能门锁青春版霸王锁防盗锁密码锁家用蓝牙密码锁防盗门电子锁家用APP蓝牙米家指纹锁 ', '899.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201475258963/O1CN01I2IBBF2G56XIhqDNU_!!2201475258963.jpg',
        'https://detail.tmall.com/item.htm?id=599376773191&skuId=4215479937337&user_id=2201475258963&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 685, 139);
INSERT INTO `goods_info`
VALUES ('599542195644', '【国家发明专利款】清华同方体脂称 好体知智能体脂秤 家用肝脏脂肪预警 精准电子秤 体重秤 测脂肪 新品M2 ', '449.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2938397126/O1CN012TNxN222VkxrDqBQc_!!2938397126.jpg',
        'https://detail.tmall.com/item.htm?id=599542195644&skuId=4352265475721&user_id=2938397126&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 593, 646);
INSERT INTO `goods_info`
VALUES ('599704840813', '立式标价牌猪肉超市生鲜价格牌挂牌展示架红酒pvc食堂展示柜水果 ', '3.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2107956721/O1CN01e1U1pC1zWGVb6Hnhg_!!2107956721.jpg',
        'https://detail.tmall.com/item.htm?id=599704840813&skuId=4189391832771&user_id=2107956721&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 1, 2);
INSERT INTO `goods_info`
VALUES ('599826402456', '花花公子男鞋夏季新款网面休闲透气运动鞋男潮流户外男士跑步鞋子 ', '198.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2261408425/O1CN01AKK9lv2C6hP3eXmf3_!!2261408425.png',
        'https://detail.tmall.com/item.htm?id=599826402456&skuId=4355688694378&user_id=2261408425&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1966, 819);
INSERT INTO `goods_info`
VALUES ('599861536883', '伊曼黄酒棒冰冰淇淋绍兴黄酒味雪糕索菲亚冰糕系列组合网红雪糕 ', '129.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/4247178839/O1CN01YwlNo12FAJNLj8Zy7_!!4247178839.jpg',
        'https://detail.tmall.com/item.htm?id=599861536883&skuId=4364785755295&user_id=4247178839&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 3, 7);
INSERT INTO `goods_info`
VALUES ('600253178661', '新生儿礼盒纯棉婴儿衣服薄款套装刚出生初生满月宝宝夏季用品大全 ', '169.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3555532691/O1CN017oHvNl1VkWNgbSy2W_!!3555532691.jpg',
        'https://detail.tmall.com/item.htm?id=600253178661&skuId=4361367562128&user_id=3555532691&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2265, 9373);
INSERT INTO `goods_info`
VALUES ('600275450964', '。新鲜巴戟天 500g 巴戟天 泡酒 巴戟鸡肠风 生鲜 ', '26.88', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2200784672227/O1CN01WizZHc1SK0aZIfDZ3_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=600275450964&skuId=4611686618702838868&user_id=2200784672227&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 5);
INSERT INTO `goods_info`
VALUES ('600635037905', 'led显示屏 广告屏门头走字电子屏户外滚动成品屏幕广告牌全彩屏 ', '150.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3394875403/O1CN01kSVcuq1pmcUnLIxZR_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=600635037905&skuId=4611686619062425809&user_id=3394875403&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1121, 818);
INSERT INTO `goods_info`
VALUES ('600666425579', '十月结晶婴儿小方巾儿童毛巾纯棉纱布口水巾用品宝宝洗脸巾6条装 ', '59.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/925772082/O1CN01QYEWvT1RFbA4FaIue_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=600666425579&skuId=4286688072855&user_id=925772082&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 9200, 6707);
INSERT INTO `goods_info`
VALUES ('601026882039', 'eoodoo婴儿衣服新生儿套装礼盒春秋夏季刚出生满月宝宝母婴用品 ', '289.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2832303009/O1CN01SfCmAB1Y6AJYweGIo_!!2832303009.jpg',
        'https://detail.tmall.com/item.htm?id=601026882039&skuId=4370206058686&user_id=2832303009&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 327, 818);
INSERT INTO `goods_info`
VALUES ('601073565783', '青岛崂山特产原浆啤酒全大麦小麦生鲜啤2L大桶装扎啤精酿白啤黄啤 ', '36.00', '生鲜酒水_', '[]',
        '[{\"厂名\":\"青岛崂迈啤酒有限公司\",\"是否为有机食品\":\"否\",\"按啤酒的生产工艺选\":\"熟啤酒\",\"产品标准号\":\"GB/T 4927\",\"储藏方法\":\"冰箱保鲜避光储存\",\"按啤酒颜色选\":\"白啤酒\",\"配料表\":\"水、麦芽、啤酒花、啤酒酵母\",\"省份\":\"山东\",\"特产品类\":\"青岛啤酒\",\"颜色分类\":\"麦公子系列 绿标精酿白啤 青岛直发 麦公子系列 红标拉格 鲜啤 青岛直发 冰克斯系列 黑标精酿 原浆鲜啤 冰克斯系列 精酿白啤艾尔 青岛直发\",\"啤酒麦汁浓度\":\"高浓度\",\"包装方式\":\"包装\",\"产地\":\"中国大陆地区\",\"品牌\":\"Royal Magic/崂迈\",\"适用场景\":\"团圆小酌区\",\"包装种类\":\"桶装\",\"保质期\":\"180 天\",\"食品添加剂\":\"无任何添加剂\",\"系列\":\"2L\",\"生产许可证编号\":\"SC11537021201723\",\"厂址\":\"青岛市崂山区王哥庄街道大桥社区居委会西20米\",\"包装数量\":\"1x1\",\"厂家联系方式\":\"18562669711\",\"净含量\":\"1x1x2000ml\",\"城市\":\"青岛市\"}]',
        'https://img.alicdn.com/bao/uploaded/i3/2206433011848/O1CN01fibXGJ1PWQVzZHJhI_!!2206433011848.jpg',
        'https://detail.tmall.com/item.htm?id=601073565783&skuId=4490660319158&user_id=2206433011848&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 88, 378);
INSERT INTO `goods_info`
VALUES ('601079706762', '博洋家纺浴室拖鞋夏天拖鞋女夏室内家用情侣男凉拖鞋防滑洗澡家居 ', '39.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/253285776/O1CN01fSm0ak1sXSHBtTtHS_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=601079706762&skuId=4373730115726&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 5, 43);
INSERT INTO `goods_info`
VALUES ('601560241212', '青岛特产原浆啤酒 生鲜扎啤 全麦拉格黄啤2L4斤大桶装 精酿啤酒 ', '48.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2206433011848/O1CN01NCyfru1PWQVbnX0Gp_!!2206433011848.jpg',
        'https://detail.tmall.com/item.htm?id=601560241212&skuId=4207551204937&user_id=2206433011848&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 10, 15);
INSERT INTO `goods_info`
VALUES ('601586785422', '青岛特产精酿原浆鲜啤酒 生鲜扎啤全麦拉格黄啤2L4斤大桶装高浓度 ', '48.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2206496092086/O1CN01RrXakA1RHQltToVjr_!!2206496092086.jpg',
        'https://detail.tmall.com/item.htm?id=601586785422&skuId=4381261415822&user_id=2206496092086&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 21, 31);
INSERT INTO `goods_info`
VALUES ('601691498424', '小狗 T10 Plushy ', '1999.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/306146306/O1CN010FOiMF1wSC966pFrM_!!306146306.png',
        'https://detail.tmall.com/item.htm?id=601691498424&skuId=4210299989404&standard=1&user_id=306146306&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 924, 0);
INSERT INTO `goods_info`
VALUES ('601752984238', '水星家纺女式家居鞋家用防滑情侣家用秋冬棉拖鞋男鞋酒店床上用品 ', '19.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/688024484/O1CN01mCSL531iziYfBs7xC_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=601752984238&skuId=4525144171125&user_id=688024484&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 24, 81);
INSERT INTO `goods_info`
VALUES ('602111432936', '青岛特产原浆精酿黑啤酒 1.5L桶装生鲜啤酒 全麦拉格工艺咖啡口味 ', '36.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2206433011848/O1CN01l0ERtC1PWQUEV29mL_!!2206433011848.jpg',
        'https://detail.tmall.com/item.htm?id=602111432936&skuId=4389612895797&user_id=2206433011848&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 10, 4);
INSERT INTO `goods_info`
VALUES ('602200130035', '水星家纺拖鞋女日式家居拖鞋家用防滑室内秋冬情侣棉拖鞋男士妍风 ', '19.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/92042735/O1CN01cmsf8A1W4fq8f4X2c_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=602200130035&skuId=4248710560150&user_id=92042735&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 618, 9202);
INSERT INTO `goods_info`
VALUES ('602214230150', '板凳厂家生鲜果蔬盒饭酒水无人自动售货机升降机扫码自助刷脸支付 ', '5000.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2206432979901/O1CN01VWdSkM2N0i0Fx4rZC_!!2206432979901.jpg',
        'https://detail.tmall.com/item.htm?id=602214230150&skuId=4423236622035&user_id=2206432979901&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 2);
INSERT INTO `goods_info`
VALUES ('602481653954', 'Haier/海尔 XQB80-BZ1269 ', '899.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/TB1riMieoz1gK0jSZLe4LP9kVXa_031123.jpg',
        'https://detail.tmall.com/item.htm?id=602481653954&skuId=4221107893566&standard=1&user_id=1983647930&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 2485, 0);
INSERT INTO `goods_info`
VALUES ('602523025323', '周星驰-做人如果没有梦想,跟咸鱼有什么分别 喜剧之王名人自传文娱明星青春成功励志畅销书籍演员自我修养表演入门课图书 ', '22.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2200794694250/O1CN01rY8JwV1hGXq7JmsaH_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=602523025323&skuId=4611686620950413227&user_id=2200794694250&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('602601813837', '小型gps定位器监听设备无线听音专业录音手机远程汽车载追跟防丢 ', '298.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201549953409/O1CN014hI3Cd1b3Mlf7CvFR_!!2201549953409.png',
        'https://detail.tmall.com/item.htm?id=602601813837&skuId=4222590169962&user_id=2201549953409&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1059, 821);
INSERT INTO `goods_info`
VALUES ('602756960881', '现货 区块链+开启智能新时代 区块链物联网数据人工智能融合技术 供应链医疗教育农业能源慈善智慧城市社交文娱行业应用技术图书籍 ', '48.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/281529659/O1CN01Frp4WT2LDsCDvJ5AG_!!281529659.jpg',
        'https://detail.tmall.com/item.htm?id=602756960881&skuId=4611686621184348785&user_id=281529659&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('602893199646', 'Toshiba/东芝 ER-SD80CNW ', '4599.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3481220124/O1CN01IOMh9A1CmpfTWt9K1_!!3481220124.jpg',
        'https://detail.tmall.com/item.htm?id=602893199646&skuId=4221220597240&standard=1&user_id=3479622146&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1230, 0);
INSERT INTO `goods_info`
VALUES ('603184066907', '青岛特产冰克斯黑标精酿原浆啤酒 全麦拉格黄啤 2L桶装生鲜扎啤酒 ', '39.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3596779519/O1CN01kWsAIp2KBkjHD0WSv_!!3596779519.jpg',
        'https://detail.tmall.com/item.htm?id=603184066907&skuId=4396806539889&user_id=3596779519&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 32, 78);
INSERT INTO `goods_info`
VALUES ('603420935578', '小米智能猫眼门铃智能电子无线家用摄像头远程监控智能夜视防盗门镜 ', '499.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/1714128138/O1CN01CtkJdI29zFmCwYO2m_!!1714128138.jpg',
        'https://detail.tmall.com/item.htm?id=603420935578&skuId=4296647468992&user_id=1714128138&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 3498, 2307);
INSERT INTO `goods_info`
VALUES ('603658284340', '探路者情侣装防晒服男式户外超薄皮肤衣女士防紫外线透气速干衣衫 ', '259.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/414285109/O1CN01lOuuAL1nby6Fwvr2W_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=603658284340&skuId=4232279333303&user_id=414285109&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1827, 307);
INSERT INTO `goods_info`
VALUES ('603658720069', '探路者防晒衣男士运动超轻薄外套户外透气防紫外线皮肤衣女款风衣 ', '259.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/414285109/O1CN014utrA91nby6HoKenQ_!!414285109.jpg',
        'https://detail.tmall.com/item.htm?id=603658720069&skuId=4232279473249&user_id=414285109&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1198, 218);
INSERT INTO `goods_info`
VALUES ('603857250391', '青岛崂山特产冰克斯精酿原浆啤酒生鲜扎啤黄黑啤组合装1.5L 3桶装 ', '96.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3596779519/O1CN01x4HKaA2KBkiCI1SGi_!!3596779519.jpg',
        'https://detail.tmall.com/item.htm?id=603857250391&skuId=4230580381379&user_id=3596779519&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 104, 117);
INSERT INTO `goods_info`
VALUES ('604072307916', '青岛特产啤酒冰克斯精酿原浆生鲜扎啤黄啤黑啤混合装1.5L 3大桶装 ', '96.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2200616139618/O1CN01WLcJz52Kv5v9aAnHY_!!2200616139618.jpg',
        'https://detail.tmall.com/item.htm?id=604072307916&skuId=4227089424191&user_id=2200616139618&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 11, 10);
INSERT INTO `goods_info`
VALUES ('604416258109', '婴儿洗澡盆宝宝折叠浴盆新生幼儿童可坐躺家用大号沐浴桶小孩用品 ', '119.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/739895684/O1CN012LTkKj1rrJpfOzO30_!!739895684-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=604416258109&skuId=4405284867469&user_id=739895684&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2178, 2660);
INSERT INTO `goods_info`
VALUES ('604622795481', '婴儿折叠浴盆宝宝洗澡盆新生儿童泡澡桶小孩游泳用品坐躺大号家用 ', '228.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2314928652/O1CN01PuC6cx2DmfK9Zjhbh_!!2314928652.jpg',
        'https://detail.tmall.com/item.htm?id=604622795481&skuId=4405273643047&user_id=2314928652&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 517, 1123);
INSERT INTO `goods_info`
VALUES ('605065678613', '李宁跑步腰包运动户外贴身男女款超轻时尚隐形超薄小多功能手机包 ', '47.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3625150285/O1CN01T1WBzC1DyZRuRB3ZW_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=605065678613&skuId=4239805237765&user_id=3625150285&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 4905, 2289);
INSERT INTO `goods_info`
VALUES ('605066414985', '李宁跑步手机臂包户外手机袋男通用手臂带运动手机臂套手腕包女款 ', '45.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3625150285/O1CN01NRnnBH1DyZRW5EeIb_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=605066414985&skuId=4236297704959&user_id=3625150285&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 876, 564);
INSERT INTO `goods_info`
VALUES ('605229113286', 'b立式标价牌超市生鲜价格牌挂牌展示架红酒pvc食堂展示柜水果 ', '7.70', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2200661713340/O1CN01gX5Yez1aXlQLgQL9j_!!2200661713340.jpeg',
        'https://detail.tmall.com/item.htm?id=605229113286&skuId=4410718630933&user_id=2200661713340&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('605392904021', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论社科 新华书店正版图书籍 中国法律图书有限公司 ', '66.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2987540729/O1CN01gDb3i51HFvILdKB5e_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=605392904021&skuId=4611686623820291925&user_id=2987540729&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('605397316433', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论 社科 中国法律图书有限公司 ', '69.60', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2933587576/O1CN01nKCFuZ25pr9ofbHAU_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=605397316433&skuId=4611686623824704337&user_id=2933587576&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('605437698395', '婴儿折叠浴盆儿童洗澡盆宝宝家用新生儿用品小孩可坐躺大号初生桶 ', '83.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/4047891440/O1CN01MCe5041MVYvRi2CE4_!!4047891440.jpg',
        'https://detail.tmall.com/item.htm?id=605437698395&skuId=4438092122575&user_id=4047891440&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 73000, 100000);
INSERT INTO `goods_info`
VALUES ('605668760613', '文娱产业知识产权保护实证研究 郝敏著 法学理论 社科 中国法律图书有限公司 ', '63.60', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2200766604654/O1CN01cYDSvZ1kFZr5G3lUA_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=605668760613&skuId=4611686624096148517&user_id=2200766604654&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('605862298940', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论社科 新华书店正版图书籍 中国法律图书有限公司 ', '66.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2972144504/O1CN01tsOAuC1j8sRh0bwbN_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=605862298940&skuId=4611686624289686844&user_id=2972144504&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('605953966381', '漓泉1998蓝瓶8度啤酒500ML*12瓶装整箱纯生鲜啤酒广西桂林特产 ', '139.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/692295771/O1CN01FKzpEr1sVAGEOS6wV_!!692295771.jpg',
        'https://detail.tmall.com/item.htm?id=605953966381&skuId=4611686624381354285&user_id=692295771&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 2, 5);
INSERT INTO `goods_info`
VALUES ('606075427254', '文娱产业知识产权保护实证研究 郝敏著 著 社科 法学理论 法学理论 新华书店正版图书籍中国法律图书有限公司 ', '66.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3376080142/O1CN01y1neRg1Cv4ohvQrCH_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606075427254&skuId=4611686624502815158&user_id=3376080142&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('606124990951', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论社科 新华书店正版图书籍 中国法律图书有限公司 ', '66.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3310271582/O1CN01jETdUK1NYb8oE8COV_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606124990951&skuId=4611686624552378855&user_id=3310271582&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('606140826049', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论 社科 中国法律图书有限公司 正版图书 ', '61.80', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2890685839/O1CN01DlI7fR1t0JC59zjfe_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606140826049&skuId=4611686624568213953&user_id=2890685839&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('606229196512', 'LOVO家纺拖鞋防滑居家室内家居拖简约时尚夹花针织情侣男女拖鞋 ', '39.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/279887075/O1CN01jbmXfL228OkXZxZzJ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606229196512&skuId=4254030709480&user_id=279887075&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 16, 265);
INSERT INTO `goods_info`
VALUES ('606352618437', '现货 区块链+开启智能新时代 区块链物联网数据人工智能融合技术 供应链医疗教育农业能源慈善智慧城市社交文娱行业应用技术图书籍 ', '48.75', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2735814791/TB2wUhddNTpK1RjSZFMXXbG_VXa_!!2735814791.jpg',
        'https://detail.tmall.com/item.htm?id=606352618437&skuId=4611686624780006341&user_id=2735814791&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('606462459551', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论社科 新华书店正版图书籍 中国法律图书有限公司 ', '72.20', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3386753267/O1CN01aF1E6z1a0KXsLcnqo_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606462459551&skuId=4611686624889847455&user_id=3386753267&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('606483097492', 'LOVO家纺秋冬季室内防滑家居厚底家用韩版情侣男棉拖鞋女士 ', '29.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/279887075/O1CN01a7Vp7u228OkdwmhQV_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606483097492&skuId=4424392851760&user_id=279887075&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 22, 553);
INSERT INTO `goods_info`
VALUES ('606639905691', '高档贡缎床上四件套特价床品套件北欧风家居家纺被套床罩欧式风格 ', '19.05', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2219349290/O1CN015BOAho2IUs1ndDTXo_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606639905691&skuId=4611686625067293595&user_id=2219349290&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 3);
INSERT INTO `goods_info`
VALUES ('606678609255', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论社科 新华书店正版图书籍 中国法律图书有限公司 ', '66.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3322362474/O1CN01OWBsrP1U98QsifU19_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606678609255&skuId=4611686625105997159&user_id=3322362474&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('606692286746', '立式标价牌猪肉超市生鲜价格牌挂牌展示架红酒pvc食堂展示柜水果 ', '6.66', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2206716709755/O1CN01AAzw202LvqBnhXohB_!!2206716709755.jpg',
        'https://detail.tmall.com/item.htm?id=606692286746&skuId=4421095446092&user_id=2206716709755&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('606709546656', 'LOVO家纺室内居家用防滑秋冬季棉拖鞋可爱情侣家居毛拖鞋男女冬天 ', '39.90', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/279887075/O1CN019YgsHT228OkZL11yb_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=606709546656&skuId=4464262290080&user_id=279887075&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 725);
INSERT INTO `goods_info`
VALUES ('606796225516', '桂林漓泉啤酒1998整箱广西 大度特酿946ml*12大瓶装纯生鲜啤酒听 ', '196.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2991171804/O1CN01bXa9ik1PCH4PSmQ3W_!!2991171804.jpg',
        'https://detail.tmall.com/item.htm?id=606796225516&skuId=4611686625223613420&user_id=2991171804&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 40, 20);
INSERT INTO `goods_info`
VALUES ('606808545439', '好孩子婴儿抱被纯棉新生初生儿用品夏天四季通用夏季薄款产房包被 ', '179.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2448368329/O1CN01prSBQP2BOjQi118HE_!!2448368329-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=606808545439&skuId=4307032408720&user_id=2448368329&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 1642, 1488);
INSERT INTO `goods_info`
VALUES ('607100927346', '新鲜人参大支【30克Ｘ2只】长白山园参条参带土保鲜参整支泡酒 ', '28.60', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2200754144018/O1CN01UXeoBS1fYHxaW9DzZ_!!2200754144018.jpg',
        'https://detail.tmall.com/item.htm?id=607100927346&skuId=4611686625528315250&user_id=2200754144018&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 98, 65);
INSERT INTO `goods_info`
VALUES ('607249208245', '5G革命 新流量时代商业方法论 许宏金 5G技术概念特点智慧零售智慧医疗智慧城市物流智能制造社交文娱5G场景应用5G发展现状图书籍 ', '55.00', '图书文娱_', '[]',
        '详情', 'https://img.alicdn.com/bao/uploaded/i1/2541072356/O1CN017QUMrq1TH5jE4iq0P_!!2541072356-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=607249208245&skuId=4611686625676596149&user_id=2541072356&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('607308655551', '【后浪图书官方直发】烈爱 文学 中国现当代随笔 传记 文娱明星 全新解读好莱坞伊丽莎白 泰勒与理查德 伯顿的世纪之恋 ', '32.27', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/927356304/TB1K7l.zeuSBuNjSsziXXbq8pXa_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=607308655551&skuId=4611686625736043455&user_id=2169854453&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 1, 0);
INSERT INTO `goods_info`
VALUES ('607771287012', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著语言文字文教 新华书店正版图书籍 商务印书馆 ', '81.50', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2972144504/O1CN01YzsJuc1j8sRwbVoLU_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=607771287012&skuId=4611686626198674916&user_id=2972144504&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('607890810772', 'gps定位器汽车神器无线远程监听设备专业录音听音跟踪追踪跟小型 ', '358.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3950905805/O1CN01WmJgVM1skjkjmSfsq_!!3950905805.jpg',
        'https://detail.tmall.com/item.htm?id=607890810772&skuId=4268744653471&user_id=3950905805&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 810, 360);
INSERT INTO `goods_info`
VALUES ('607996584822', '婴儿洗澡盆宝宝浴盆可折叠伸缩坐躺儿童家用初生新生儿用品大号桶 ', '109.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/723317446/O1CN01yqcEBp24sJh7PiD3B_!!723317446-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=607996584822&skuId=4440085482455&user_id=723317446&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 41000, 22000);
INSERT INTO `goods_info`
VALUES ('608035979251', '华为旗下荣耀智能体脂秤2电子秤体重秤家用官方旗舰称重健康减肥精准体脂体重心率监测迷你小巧 ', '79.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1114511827/O1CN01A1OSU81PMoD920J4z_!!1114511827.jpg',
        'https://detail.tmall.com/item.htm?id=608035979251&skuId=4267817845089&user_id=1114511827&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 13000, 11000);
INSERT INTO `goods_info`
VALUES ('608451190256', '华为智能体脂秤2Pro家用体脂秤电子秤精准体重蓝牙WiFi双连接暂不支持ios ', '499.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2838892713/O1CN01cTV8D11Vub7nz96r4_!!2838892713.jpg',
        'https://detail.tmall.com/item.htm?id=608451190256&skuId=4272584521937&user_id=2838892713&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1030, 1214);
INSERT INTO `goods_info`
VALUES ('608470524297', '婴儿洗澡盆宝宝折叠浴盆家用可坐躺新生儿用品男女小孩沐浴桶大号 ', '127.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2204156529921/O1CN01ZkPRqa2N9rwWIroOe_!!2204156529921.jpg',
        'https://detail.tmall.com/item.htm?id=608470524297&skuId=4445614114223&user_id=2204156529921&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 9624, 8654);
INSERT INTO `goods_info`
VALUES ('608536684165', '骆驼户外速干裤2020夏新款男女薄款透气快干裤弹力运动速干长裤子 ', '129.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/648476316/O1CN01JdLlKv1wWm9Q9hwHE_!!648476316.jpg',
        'https://detail.tmall.com/item.htm?id=608536684165&skuId=4275445816780&user_id=648476316&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 3454, 793);
INSERT INTO `goods_info`
VALUES ('609501868397', '新生婴儿洗澡盆浴盆宝宝可折叠幼儿坐躺大号浴桶小孩家用儿童用品 ', '93.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2314928652/O1CN01xzZxNZ2DmfLUGfCNj_!!2314928652.jpg',
        'https://detail.tmall.com/item.htm?id=609501868397&skuId=4458739467480&user_id=2314928652&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 54000, 31000);
INSERT INTO `goods_info`
VALUES ('609542052270', 'AUX/奥克斯 8917 ', '349.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2409607501/O1CN01IlwyTC25HVSrl6AO1_!!2409607501.jpg',
        'https://detail.tmall.com/item.htm?id=609542052270&skuId=4487172871901&standard=1&user_id=2409607501&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 4167, 0);
INSERT INTO `goods_info`
VALUES ('609551428077', '富安娜家纺圣之花毛毯办公室盖毯午休毯沙发毯法兰绒毯家居小毯子 ', '29.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/268691146/O1CN01bfomQt1KKuUYCjOFF_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=609551428077&skuId=4317428352563&user_id=268691146&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 61, 84);
INSERT INTO `goods_info`
VALUES ('609664493135', 'dyson/戴森 dyson v8 slim ', '2890.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i7/TB1g3Bdr.T1gK0jSZFrM_cNCXXa_050420.jpg',
        'https://detail.tmall.com/item.htm?id=609664493135&skuId=4454449394933&standard=1&user_id=2089100916&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 7429, 0);
INSERT INTO `goods_info`
VALUES ('609698018008', '九元生鲜啤酒玉米杂粮老坛发酵野钓鲫鲤草小麦玉米打窝钓鱼窝饵料 ', '10.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3973331721/O1CN01qzWfwn1OaGE4tAsgx_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=609698018008&skuId=4280724440238&user_id=3973331721&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 15, 11);
INSERT INTO `goods_info`
VALUES ('609977403054', 'TheNorthFace北面2020夏季防晒衣男士透气防晒服女皮肤风衣外套衫 ', '599.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1834007274/O1CN010foHtm23bXaAVK9hO_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=609977403054&skuId=4285054477236&user_id=1834007274&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1679, 781);
INSERT INTO `goods_info`
VALUES ('610198811457', '骆驼登山鞋子男2020夏季新透气官网面厚底防滑女士运动户外徒步鞋 ', '249.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/648476316/O1CN016QEErh1wWm9OFSZvf_!!648476316.jpg',
        'https://detail.tmall.com/item.htm?id=610198811457&skuId=4284082216747&user_id=648476316&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 2921, 857);
INSERT INTO `goods_info`
VALUES ('610212650715', '限量促销 板凳厂家生鲜果蔬盒饭酒水无人自动售货机履带升降机自 ', '6000.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201235297579/O1CN01gaHUlN25rEMPBGEVt_!!2201235297579.jpg',
        'https://detail.tmall.com/item.htm?id=610212650715&skuId=4458113686621&user_id=2201235297579&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('610238112281', '世纪宝贝婴儿洗屁屁神器宝宝洗屁股盆新生儿童洗PP洗澡盆孩子用品 ', '59.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2104720594/O1CN01hHTlAj1GG5qQyiQP0_!!2104720594.jpg',
        'https://detail.tmall.com/item.htm?id=610238112281&skuId=4475739579657&user_id=2104720594&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2543, 1231);
INSERT INTO `goods_info`
VALUES ('610349984711', '雄满两门展示柜饮料啤酒冰箱冰柜超市便利店餐厅冷柜生鲜水果保鲜 ', '3880.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2206833303412/O1CN01B7L3VE1b4jyVe8AmW_!!2206833303412.jpg',
        'https://detail.tmall.com/item.htm?id=610349984711&skuId=4295315612279&user_id=2206833303412&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('610456407220', '限量 板凳厂家生鲜果蔬盒饭酒水无人自动售货机履带升降机自 ', '6000.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2206408827419/O1CN01ozqVPU24fwzQclY8x_!!2206408827419.jpg',
        'https://detail.tmall.com/item.htm?id=610456407220&skuId=4461539307996&user_id=2206408827419&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('610511676428', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论 社科 中国法律图书有限公司 ', '60.90', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2890535985/O1CN01c1RdEA1u5B2AhQ1JY_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610511676428&skuId=4611686628939064332&user_id=2890535985&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('610511824216', '文娱产业知识产权保护实证研究 郝敏著 法学理论 社科 中国法律图书有限公司 ', '60.90', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2200593242593/O1CN01DjTCYf1V1dZwuBFEq_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610511824216&skuId=4611686628939212120&user_id=2200593242593&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('610618541415', '雄满饮料展示柜商用超市便利店啤酒冷藏冰箱冰柜生鲜水果保鲜冷柜 ', '11360.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2206833303412/O1CN01LOys7m1b4jxYQjjZ2_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610618541415&skuId=4469804235060&user_id=2206833303412&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('610618584273', '骆驼防晒衣服女长袖轻薄透气披肩斗篷防紫外线皮肤衣防晒衫夏季潮 ', '159.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/648476316/O1CN01Q91GLE1wWm9Q3nVhP_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610618584273&skuId=4302218161663&user_id=648476316&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 6964, 917);
INSERT INTO `goods_info`
VALUES ('610708921124', '立式标价牌猪肉超市生鲜价格牌挂牌展示架红酒pvc食堂展示柜水果 ', '2.70', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2206487323246/O1CN01El3cEE1ZqiCxeYZKV_!!2206487323246.jpg',
        'https://detail.tmall.com/item.htm?id=610708921124&skuId=4470789487899&user_id=2206487323246&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 1, 1);
INSERT INTO `goods_info`
VALUES ('610737971261', '小米智能猫眼家用高清电子监控摄像头智能视频监控器夜视防盗门镜wifi米家可视门铃 ', '469.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2201475258963/O1CN01f0g21k2G56X9pKexm_!!2201475258963.jpg',
        'https://detail.tmall.com/item.htm?id=610737971261&skuId=4294446777270&user_id=2201475258963&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1122, 237);
INSERT INTO `goods_info`
VALUES ('610783059666', '水星家纺全棉纯棉1.8m床双人1.5米双人印花家居被套床单三/四件套 ', '399.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2206500496804/O1CN01tMyjjQ208HQhY3nPU_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610783059666&skuId=4528652566803&user_id=2206500496804&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 97, 98);
INSERT INTO `goods_info`
VALUES ('610859182851', '雄满两门展示柜便利店饮料啤酒冰箱柜商用超市生鲜水果保鲜冷藏柜 ', '5280.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2206833303412/O1CN01sFe6rJ1b4jxWvB2YA_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610859182851&skuId=4469800967961&user_id=2206833303412&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('610895944590', '正版 只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '38.80', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/684798650/O1CN01vM25hc2DlkYF70q69_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=610895944590&skuId=4611686629323332494&user_id=684798650&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('610931292985', 'Lavera 拉薇有机腮红粉饼 ', '118.53', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2201487671076/O1CN018S4X5q1Joqi1Z73mR_!!2201487671076.png',
        'https://detail.tmall.com/item.htm?id=610931292985&skuId=4476448447894&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('610931480930', 'Lavera 有机q10遮瑕笔 ', '142.84', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201487671076/O1CN01dbLcou1JoqiDzhT3a_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=610931480930&skuId=4302002644596&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 2, 0);
INSERT INTO `goods_info`
VALUES ('610931724548', 'Lavera 四色眼影 印度之梦 ', '120.08', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2201487671076/O1CN01QzMyR71Joqi0SVUiA_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=610931724548&skuId=4476449771452&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 33, 0);
INSERT INTO `goods_info`
VALUES ('610931728579', 'Lavera 拉薇眉毛定型啫喱 ', '94.86', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201487671076/O1CN01z5gxl21Joqi84I5HS_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=610931728579&skuId=4305736801118&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 8, 0);
INSERT INTO `goods_info`
VALUES ('610931768538', 'Lavera 有机睫毛膏 ', '127.80', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/TB1E_GpfKH2gK0jSZJnHwuT1FXa_045248.jpg',
        'https://detail.tmall.com/item.htm?id=610931768538&skuId=4476449967556&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 13, 0);
INSERT INTO `goods_info`
VALUES ('610932000181', 'Lavera 睫毛护理精华液 ', '93.27', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201487671076/O1CN013SoRKh1JoqhxOUpyn_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=610932000181&skuId=4476449515245&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 13, 0);
INSERT INTO `goods_info`
VALUES ('610932136008', 'Lavera 有机干湿两用粉底 ', '142.07', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2201487671076/O1CN01gqsiMN1Joqhxqzlbi_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=610932136008&skuId=4305735537970&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 5, 0);
INSERT INTO `goods_info`
VALUES ('610932196026', 'Lavera 有机柔软唇线笔 ', '77.99', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2201487671076/O1CN01nz46zB1JoqhzctzOa_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=610932196026&skuId=4305736241570&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 213, 0);
INSERT INTO `goods_info`
VALUES ('610981897793', '只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 登顶电影手册年度十佳联合天畅 ', '37.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2735814791/O1CN01LUNuRr1lGK9JH4pon_!!2735814791-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=610981897793&skuId=4611686629409285697&user_id=2735814791&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('611077261442', '只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '37.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2680114444/O1CN01j24LCU1ihOhLrUBCS_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611077261442&skuId=4611686629504649346&user_id=2680114444&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('611097759802', '雄满三门饮料风冷展示柜商用超市便利店啤酒生鲜冷藏柜保鲜冰箱 ', '8520.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2206833303412/O1CN01RmXLYw1b4jxTOPj7V_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611097759802&skuId=4469804799947&user_id=2206833303412&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('611104175121', '雄满饮料展示柜商用超市便利店冰箱冰柜双门三门啤酒冷藏生鲜冷柜 ', '11360.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2206833303412/O1CN01fhLIFu1b4jxOiMAY9_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611104175121&skuId=4466629498199&user_id=2206833303412&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('611175818510', 'gb好孩子婴儿纱布巾纯棉口水巾手帕洗脸巾儿童小方巾超软宝宝用品 ', '59.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/379833581/O1CN01j6dmcs1cK8tTOEBOx_!!379833581.jpg',
        'https://detail.tmall.com/item.htm?id=611175818510&skuId=4470246542227&user_id=379833581&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 2191, 600);
INSERT INTO `goods_info`
VALUES ('611198449104', 'Lavera 有机天然眼线液 ', '95.09', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201487671076/O1CN01I1p9ET1Joqi4iWNgk_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=611198449104&skuId=4302002936144&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 6, 0);
INSERT INTO `goods_info`
VALUES ('611441386519', 'Lavera 单色眼影 ', '90.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2201487671076/O1CN01t2eyZn1Joqibs2s8j_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=611441386519&skuId=4473189610327&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 13, 0);
INSERT INTO `goods_info`
VALUES ('611441454497', 'Lavera 有机慕丝腮红 ', '97.68', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2201487671076/O1CN01fNR4Ku1JoqiOI3UOB_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=611441454497&skuId=4476450103350&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 7, 0);
INSERT INTO `goods_info`
VALUES ('611441614348', 'Lavera 有机持久哑色唇膏笔 ', '107.84', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2201487671076/O1CN01XBnr2z1Joqi1vULR7_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=611441614348&skuId=4305737065539&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 1, 0);
INSERT INTO `goods_info`
VALUES ('611441758057', 'Lavera 有机四色眼影 ', '106.52', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201487671076/O1CN01Rbd9cQ1JoqivEjmXi_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=611441758057&skuId=4473188790732&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 7, 0);
INSERT INTO `goods_info`
VALUES ('611556067559', '只为女人拍电影沟口健二的世界佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '37.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/641669429/O1CN01XUb7Ia2JWX5RtbmQo_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611556067559&skuId=4611686629983455463&user_id=641669429&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('611642523681', '正版 只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '38.80', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2458152951/O1CN015RVoBz1XfbNCYjZj1_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611642523681&skuId=4611686630069911585&user_id=2458152951&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('611678299614', 'Lavera 拉薇有机唇彩 ', '105.76', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201487671076/O1CN01k0slS71JoqiGreVYM_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=611678299614&skuId=4305736597615&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 20, 0);
INSERT INTO `goods_info`
VALUES ('611681052387', '【清华测脂技术】清华同方体脂称 好体知智能体脂秤 精准家用电子秤体重秤体质称 延保套餐款 专业测体脂 ', '318.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2938397126/O1CN01DZRZMf22VkwnS48R6_!!2938397126.jpg',
        'https://detail.tmall.com/item.htm?id=611681052387&skuId=4611686630108440291&user_id=2938397126&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1070, 347);
INSERT INTO `goods_info`
VALUES ('611736149634', 'Midea/美的 SAD35EA ', '239.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1744401399/O1CN01DjG2Fq1MCmgAEHV1k_!!1744401399.jpg',
        'https://detail.tmall.com/item.htm?id=611736149634&skuId=4361502733860&standard=1&user_id=201749140&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 72000, 0);
INSERT INTO `goods_info`
VALUES ('611764137154', '【官方正品】华为体脂秤家用成人精准电子人体秤减肥智能正品体重测称女男运动健康蓝牙体质秤机wifi版通用 ', '69.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2454314990/O1CN01tHpogh1mjSx9o3yF7_!!2454314990.png',
        'https://detail.tmall.com/item.htm?id=611764137154&skuId=4480692915808&user_id=2454314990&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 858, 401);
INSERT INTO `goods_info`
VALUES ('611818375413', '【限量秒杀】富安娜家纺圣之花家居床上用品空调被暖绒透气夏被 ', '129.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/820387374/O1CN01MKHTWz24LLAuOKWjl_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611818375413&skuId=4307151781655&user_id=820387374&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 1, 0);
INSERT INTO `goods_info`
VALUES ('611827948465', 'jeep旗舰店防晒服男超薄透气冰丝皮肤衣跑步防晒衣男防紫外线户外 ', '279.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2182612082/O1CN01Uuv6Mf1RFbD2Eaqo0_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611827948465&skuId=4311975745169&user_id=2182612082&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 947, 499);
INSERT INTO `goods_info`
VALUES ('611929045402', '现货 区块链+开启智能新时代 区块链物联网数据人工智能融合技术 供应链医疗教育农业能源慈善智慧城市社交文娱行业应用技术图书籍 ', '48.75', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2736198043/O1CN01rpO13v29Hk8oWiFxN_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=611929045402&skuId=4611686630356433306&user_id=2736198043&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('612013968902', '果园生鲜超市水果农场蔬菜小型百货生活超市开业宣传单海报生活用品家电烟酒茶啤酒饮料宣传单设计制作电子版 ', '80.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2207251107470/O1CN01gOyUO2253JC6gNkMM_!!2207251107470.jpg',
        'https://detail.tmall.com/item.htm?id=612013968902&skuId=4483620851522&user_id=2207251107470&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('612087256976', '家具家纺专卖店3dmax模型CAD施工图平面图家居家私展厅布艺店素材 ', '3.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1689021762/O1CN015vU2rr1Ot2S63v8EK_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=612087256976&skuId=4611686630514644880&user_id=1689021762&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 16, 3);
INSERT INTO `goods_info`
VALUES ('612095673079', 'Jeep吉普防晒服男超薄款夏季透气休闲皮肤衣户外运动防紫外线外套 ', '288.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2182612082/O1CN01hU9qnx1RFbCEzXA4e_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=612095673079&skuId=4482731347208&user_id=2182612082&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 433, 190);
INSERT INTO `goods_info`
VALUES ('612177893806', '塑料板美容院小吃店酒吧茶盘专用生鲜托盘食堂好清洗实用羊肉串 ', '8.68', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2206683850808/O1CN01DGwDuG1Hq6bV87rk8_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=612177893806&skuId=4483118583518&user_id=2206683850808&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 2);
INSERT INTO `goods_info`
VALUES ('612219330987', '探路者防晒服男皮肤衣女薄款防紫外线透气超薄户外钓鱼外套衫夏季 ', '218.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2207360872588/O1CN01uQPOhi1UzLcMHsalT_!!2207360872588-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=612219330987&skuId=4611686630646718891&user_id=2207360872588&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1012, 393);
INSERT INTO `goods_info`
VALUES ('612255597102', '安踏男子凉鞋2020年夏季新款外穿户外软底舒适沙滩鞋运动凉鞋男潮 ', '139.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/385132127/O1CN01ShR90V1RaD1xH1pWo-385132127.jpg',
        'https://detail.tmall.com/item.htm?id=612255597102&skuId=4308939516388&user_id=385132127&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 4895, 601);
INSERT INTO `goods_info`
VALUES ('612267782095', '阿迪达斯官网 adidas TERREX SWIFT SOLO 男女户外运动鞋D67031 ', '489.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/446338500/O1CN01zE2HPC2Cf39vUmLfw_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=612267782095&skuId=4311501617554&user_id=446338500&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 317, 220);
INSERT INTO `goods_info`
VALUES ('612268394056', '只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '37.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2628548231/O1CN01pmDvbH2AfqbQ5vaX9_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=612268394056&skuId=4611686630695781960&user_id=2628548231&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('612288629845', 'Haier/海尔 XPM30-2008 ', '299.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i5/T1HNefFyBcXXcjNLgV_020420.jpg',
        'https://detail.tmall.com/item.htm?id=612288629845&skuId=4480343546091&standard=1&user_id=1620299819&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 513, 0);
INSERT INTO `goods_info`
VALUES ('612309933561', '感温婴儿洗澡盆家用宝宝可折叠浴盆坐躺大号初生新生儿童小孩用品 ', '99.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2362414859/O1CN01EFpPPp1llT4JR23YC_!!2362414859.jpg',
        'https://detail.tmall.com/item.htm?id=612309933561&skuId=4483717291300&user_id=2362414859&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 6752, 8118);
INSERT INTO `goods_info`
VALUES ('612392487942', 'Panasonic松下化妆镜台式桌面led灯充电梳妆镜便携补光美妆镜带灯 ', '199.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2207260630727/O1CN01hzFHZr1HF0XVEJjUu_!!2207260630727.jpg',
        'https://detail.tmall.com/item.htm?id=612392487942&skuId=4483396759196&user_id=2207260630727&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 2010, 0);
INSERT INTO `goods_info`
VALUES ('612629441151', '小熊个护led化妆镜带灯大美颜补光灯美妆镜子桌面梳妆台式收纳盒 ', '139.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2207084169782/O1CN01o6WotF2M8Cu7817QZ_!!2207084169782.jpg',
        'https://detail.tmall.com/item.htm?id=612629441151&skuId=4485382659170&user_id=2207084169782&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 12, 0);
INSERT INTO `goods_info`
VALUES ('612725860456', '纽曼gps定位器汽车跟踪追踪神器无线录音小型远程监听音设备手机 ', '368.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201480122132/O1CN01CsN1dR1RcUzzmGS61_!!2201480122132.png',
        'https://detail.tmall.com/item.htm?id=612725860456&skuId=4317245669271&user_id=2201480122132&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 306, 97);
INSERT INTO `goods_info`
VALUES ('612775331630', '婴儿抱被新生儿包被春秋季薄款纯棉小被子初生儿襁褓包巾宝宝用品 ', '49.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1739355048/O1CN01Lx3dp71nA1vQ5ftAP_!!1739355048.jpg',
        'https://detail.tmall.com/item.htm?id=612775331630&skuId=4312890149842&user_id=1739355048&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 4482, 1036);
INSERT INTO `goods_info`
VALUES ('612808192608', 'Midea/美的智能化妆镜/台灯LED带灯美妆镜桌面便携美颜补光美颜镜 ', '139.00', '美妆个护_', '[]',
        '[{\"品牌\":\"Midea/美的\",\"货号\":\"MTD5-M/K-12\",\"镜面材质\":\"有色镜\",\"是否发光\":\"发光\",\"颜色分类\":\"【淡雅白】人气款 【樱花粉】新款上市\",\"镜框材料\":\"ABS\",\"化妆镜类型\":\"化妆镜\",\"商品类型\":\"个人洗漱/清洁/护理\",\"风格\":\"日式\",\"适用空间\":\"化妆间\"}]',
        'https://img.alicdn.com/bao/uploaded/i4/2207556597632/O1CN01tr9fJN26FVNB2Ns2l_!!2207556597632.jpg',
        'https://detail.tmall.com/item.htm?id=612808192608&skuId=4488705791672&user_id=2207556597632&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 58, 0);
INSERT INTO `goods_info`
VALUES ('612830707637', 'SINGFUN/先锋 DLD-D17 ', '139.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/506943157/O1CN01Dm53ye1ZBwxXjFgPN_!!506943157.jpg',
        'https://detail.tmall.com/item.htm?id=612830707637&skuId=4483912651635&standard=1&user_id=3705326520&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 42000, 0);
INSERT INTO `goods_info`
VALUES ('612967265311', 'Robam/老板 CXW-260-27N0 ', '4099.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/165229494/O1CN01Nel9Vp2K0IpuE4gJw_!!165229494.jpg',
        'https://detail.tmall.com/item.htm?id=612967265311&skuId=4313303408734&standard=1&user_id=165229494&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 1533, 0);
INSERT INTO `goods_info`
VALUES ('612979605098', 'Toshiba/东芝 ER-SS20CNW ', '799.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3487293652/O1CN01H2FIRt1cqf15D4MGf_!!3487293652.png',
        'https://detail.tmall.com/item.htm?id=612979605098&skuId=4484628646580&user_id=3487293652&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 677, 0);
INSERT INTO `goods_info`
VALUES ('613002304690', '微米智能寻址生鲜蔬菜贩卖机红酒高端升降式售货机厂家 ', '24500.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3885003954/O1CN01mwW2zU1f4ydDnrPml_!!3885003954.jpg',
        'https://detail.tmall.com/item.htm?id=613002304690&skuId=4487191758663&user_id=3885003954&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('613064880728', 'Huawei华为智能体脂秤WiFi版电子秤体脂秤 ', '199.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2838892713/O1CN01rjZW0G1Vub7th9it9_!!2838892713.jpg',
        'https://detail.tmall.com/item.htm?id=613064880728&skuId=4316471072566&user_id=2838892713&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 1535, 339);
INSERT INTO `goods_info`
VALUES ('613199289173', '木林森凉鞋男2020夏季新款真皮包头沙滩鞋防滑软底户外运动休闲鞋 ', '168.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2111544756/O1CN01Kuvw1u1l0IHFTxejD_!!2111544756.jpg',
        'https://detail.tmall.com/item.htm?id=613199289173&skuId=4489748551156&user_id=2111544756&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 986, 644);
INSERT INTO `goods_info`
VALUES ('613217584012', 'veta 维塔眉/睫毛滋养液2.8 ML ', '229.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2207543094785/O1CN01lrEFOT1lDZlLwPfkX_!!2207543094785.jpg',
        'https://detail.tmall.com/item.htm?id=613217584012&skuId=4489014274410&user_id=2207543094785&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 6, 0);
INSERT INTO `goods_info`
VALUES ('613348457362', '漆黑清晨 布雷特安德森著 传奇摇滚乐队山羊皮主唱布雷特安德回忆录文娱明星传记类散文 艺术音乐名人图书籍 ', '36.40', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2041592426/O1CN011k2PQM1Tn9RVPq54g_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=613348457362&skuId=4611686631775845266&user_id=358183109&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('613378397392', '婴儿折叠浴盆儿童洗澡盆家用神器宝宝新生儿用品小孩可坐躺大号桶 ', '69.90', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3175475802/O1CN01vByOe11sjMYthAYM9_!!3175475802.jpg',
        'https://detail.tmall.com/item.htm?id=613378397392&skuId=4316858820128&user_id=3175475802&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 26000, 6090);
INSERT INTO `goods_info`
VALUES ('613432702922', 'TheNorthFace北面2020新款短袖T恤男速干衣户外运动半袖圆领4NCR ', '169.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1834007274/O1CN01S2Ropa23bXa6vwuD9_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=613432702922&skuId=4315060224310&user_id=1834007274&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 2963, 1141);
INSERT INTO `goods_info`
VALUES ('613519006304', '青岛特产精酿原浆啤酒全大麦拉格高浓度生鲜啤1.5L大桶装扎啤黄啤 ', '33.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2207523835515/O1CN01FXHxCA1qbutHs8zwv_!!2207523835515.jpg',
        'https://detail.tmall.com/item.htm?id=613519006304&skuId=4319657405695&user_id=2207523835515&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 87, 55);
INSERT INTO `goods_info`
VALUES ('613562215942', 'Midea/美的智能化妆镜 便携网红少女台式桌面led带灯美妆卧室收纳 ', '169.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2207556597632/O1CN01idvYlv26FVMTAocmk_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=613562215942&skuId=4488666767601&user_id=2207556597632&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 6, 0);
INSERT INTO `goods_info`
VALUES ('613567647051', 'Midea/美的化妆镜 便携式网红led带灯美妆镜智能日光补光眼妆放大 ', '239.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2207556597632/O1CN01wYc3Fj26FVMSJoYqa_!!2207556597632.jpg',
        'https://detail.tmall.com/item.htm?id=613567647051&skuId=4317900757749&user_id=2207556597632&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 157, 0);
INSERT INTO `goods_info`
VALUES ('613595882194', '漆黑清晨 布雷特安德森著 传奇摇滚乐队山羊皮主唱布雷特安德回忆录文娱明星传记类散文 艺术音乐名人图书籍 ', '36.40', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2041592426/O1CN011k2PQM1Tn9RVPq54g_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=613595882194&skuId=4611686632023270098&user_id=640504782&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('613595958643', 'Lavera 有机天然卷翘睫毛膏 ', '104.92', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201487671076/O1CN01V5428c1Joqj1gty0s_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=613595958643&skuId=4316570452797&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('613596394065', 'Lavera 有机烟熏笔 ', '100.76', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2201487671076/O1CN01EpPA9n1JoqigFcL86_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=613596394065&skuId=4491162103213&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 10, 0);
INSERT INTO `goods_info`
VALUES ('613664475578', '漆黑清晨 布雷特安德森著 传奇摇滚乐队山羊皮主唱布雷特安德回忆录文娱明星传记类散文 艺术音乐名人图书籍 ', '38.80', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2041592426/O1CN01e4jKWe1Tn9RvO0bJs_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=613664475578&skuId=4611686632091863482&user_id=2041592426&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 5, 5);
INSERT INTO `goods_info`
VALUES ('613819080106', '户外led显示屏走字电子屏防水广告牌滚动屏幕车载后窗挡风玻璃屏 ', '30.00', '电子设备_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2200712193003/O1CN01D8IiKr1Y3PyZ1bDmZ_!!2200712193003.jpg',
        'https://detail.tmall.com/item.htm?id=613819080106&skuId=4611686632246468010&user_id=2200712193003&cat_id=2&is_b=1&rn=dd8ab3d7db99c776467135ff945c82fa',
        'TMALL', NULL, '2020-05-11 03:24:41', 467, 209);
INSERT INTO `goods_info`
VALUES ('613838775737', 'Lavera 拉薇有机眼影底霜 ', '74.11', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2201487671076/O1CN01tZyYUR1Joqi65YvHD_!!2201487671076.png',
        'https://detail.tmall.com/item.htm?id=613838775737&skuId=4316570428538&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 9, 0);
INSERT INTO `goods_info`
VALUES ('613838887618', 'Lavera 有机慕丝粉底膏 ', '137.59', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2201487671076/O1CN01PGdLKl1JoqjefOFBL_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=613838887618&skuId=4320349897487&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 4, 0);
INSERT INTO `goods_info`
VALUES ('613839347029', 'Lavera 有机天然矿物粉饼 ', '127.02', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/2201487671076/O1CN01Pdu6aS1JoqiRR8lvO_!!2201487671076.jpg',
        'https://detail.tmall.com/item.htm?id=613839347029&skuId=4491161771599&user_id=2206961846700&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 2, 0);
INSERT INTO `goods_info`
VALUES ('613841479034', '阿迪达斯官网DAROGA TWO 13 S.RDY男子户外运动鞋FY1783 FY1784 ', '529.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/446338500/O1CN01jysTGX2Cf39ucsnNe_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=613841479034&skuId=4491181283156&user_id=446338500&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 1362, 345);
INSERT INTO `goods_info`
VALUES ('614124880140', '正版图书 开心谜语小百科:文娱体育 高伟杰 中国社会出版社 ', '49.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/701794424/O1CN01UZf2DO1iYEmkexN2b_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=614124880140&skuId=4611686632552268044&user_id=701794424&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('614359109681', '博洋家纺纯色拖鞋情侣室内木板地防滑家居保暖家用双人软底拖鞋女 ', '69.00', '家居家纺_居家布艺 住宅家具/办公家具',
        '[门帘, 夏季凉拖, 春秋居家拖, 地毯, 浴裙/浴袍/浴衣, 沙发垫, 靠垫/抱枕, 浴巾, 货架/柜台, 特殊家具]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/253285776/O1CN018dX83r1sXSH8fimSr_!!253285776.jpg',
        'https://detail.tmall.com/item.htm?id=614359109681&skuId=4509485179725&user_id=253285776&cat_id=2&is_b=1&rn=19c2c2f4184bbfad61fda1967cd9af9b',
        'TMALL', NULL, '2020-05-11 03:24:44', 0, 0);
INSERT INTO `goods_info`
VALUES ('614510158536', '超市货架展示架水果店蔬菜生鲜陈列柜零食红酒蛋糕架多层中岛展架 ', '365.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/690240783/O1CN01aCacOp1HeeiaofrKv_!!690240783-0-pixelsss.jpg',
        'https://detail.tmall.com/item.htm?id=614510158536&skuId=4329271305641&user_id=690240783&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 5, 2);
INSERT INTO `goods_info`
VALUES ('614674722729', 'Airmate/艾美特 CS35-R1 ', '269.00', '家用电器_厨房电器 大家电',
        '[电饭煲, 其它厨房家电, 酸奶机, 破壁机, 微波炉, 榨汁机, 电饼铛/烤饼机, 电烤箱, 油烟机, 厨房冰箱, 洗衣机, 嵌入式电烤箱]', '详情',
        'https://img.alicdn.com/bao/uploaded/i8/TB1jdVOLSzqK1RjSZFLztAn2XXa_051317.jpg',
        'https://detail.tmall.com/item.htm?id=614674722729&skuId=4502094811505&standard=1&user_id=904111764&cat_id=2&is_b=1&rn=748c27ee97457a72aac53b32c3c324f1',
        'TMALL', NULL, '2020-05-11 03:24:47', 4041, 0);
INSERT INTO `goods_info`
VALUES ('614687982477', 'babycare婴儿洗脸毛巾新生儿用品纱布小方巾超柔软宝宝纯棉口水巾 ', '79.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2275046294/O1CN01VbsCoY1wMhQWoaPrM_!!2275046294.jpg',
        'https://detail.tmall.com/item.htm?id=614687982477&skuId=4327515752600&user_id=2275046294&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 5575, 781);
INSERT INTO `goods_info`
VALUES ('614700470365', '三利达龙爪X8复合弓箭滑轮弓射箭套装户外狩猎成人入门射击运动 ', '849.00', '运动户外_户外鞋服/装备 运动服',
        '[服装类, 速干衣裤, 包袋类, 配饰类, 户外运动手表, 鞋靴类, 皮肤风衣, 冲锋衣裤, 商场同款, 运动长裤, 女子运动裤, 运动夹克, 短袖T恤, 运动短裤/七分裤]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2759166248/O1CN01EevpK11w1dD9R71lw_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=614700470365&skuId=4327680292163&user_id=2759166248&cat_id=2&is_b=1&rn=c7008278127522ae55763393c05e2bb2',
        'TMALL', NULL, '2020-05-11 03:24:42', 233, 97);
INSERT INTO `goods_info`
VALUES ('614963853629', '只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '37.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2041592426/O1CN01OfxLiF1Tn9RB4jzBx_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=614963853629&skuId=4611686633391241533&user_id=358183109&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('615247800642', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论 社科 中国法律图书有限公司 ', '67.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2344863630/O1CN01L9176H1cgaJH3a7gT_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615247800642&skuId=4611686633675188546&user_id=2344863630&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('615286082189', '塑料板美容院小吃店酒吧茶盘专用生鲜托盘食堂好清洗实用羊肉串 ', '16.22', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/1028303063/O1CN01H21JP51YUtkTrteVd_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615286082189&skuId=4331377656400&user_id=1028303063&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 1, 0);
INSERT INTO `goods_info`
VALUES ('615379532882', '实用现代汉语语法(第3版) 刘月华 潘文娱 故韡 著 著 语言文字文教 新华书店正版图书籍 商务印书馆 ', '87.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/3354676697/O1CN01dVQ6lC1zLH2zZXXIQ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615379532882&skuId=4611686633806920786&user_id=3354676697&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('615595261086', '松下LED化妆镜多功能灯梳子美颜镜美妆镜小仙镜带灯放大镜网红款 ', '269.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2207260630727/O1CN01T65hXk1HF0XSCJJNS_!!2207260630727.jpg',
        'https://detail.tmall.com/item.htm?id=615595261086&skuId=4336569224557&user_id=2207260630727&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 99, 0);
INSERT INTO `goods_info`
VALUES ('615685219832', '超市手提购物篮生鲜加厚杂物家具水果四轮酒吧酒水大号日式新款 ', '19.70', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/1577681985/O1CN01M2uvAX1QXAmtPU2lC_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615685219832&skuId=4336581533108&user_id=1577681985&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 7, 5);
INSERT INTO `goods_info`
VALUES ('615689713425', '文娱产业知识产权保护实证研究 郝敏著 法学理论 社科 中国法律图书有限公司 ', '70.40', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2201413041030/O1CN01dTIiP51JTmXcUZAXA_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615689713425&skuId=4611686634117101329&user_id=2201413041030&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('615697881192', '。2019年化妆品行业彩妆美妆护肤个护市场发展及品牌研究分析报告 ', '24.98', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/2207271907576/O1CN01BBhVGR25prBkjuMcY_!!2207271907576.png',
        'https://detail.tmall.com/item.htm?id=615697881192&skuId=4611686634125269096&user_id=2207271907576&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 4, 0);
INSERT INTO `goods_info`
VALUES ('615876328467', '序曲或一位诗人心灵的成长:沙发图书馆:文娱读物(威廉华兹华斯;9787301285831;北京大学出版社;59.00) ', '40.10', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3025552356/O1CN01u6FknV1TH5j7ivnMZ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615876328467&skuId=4611686634303716371&user_id=3025552356&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('615887464297', '沙发图书馆人间世—波希米亚香港:沙发图书馆人间世:文娱读物(廖伟棠;9787301192269;北京大学出版社;27.00) ', '18.40', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/645427271/O1CN01w5jkx123aAOCHxjaJ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=615887464297&skuId=4611686634314852201&user_id=645427271&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('616138655011', '正版 只为女人拍电影 沟口健二的世界 佐藤忠男著 文娱明星传记图书连续五年入围两度斩获威尼斯银狮奖 两次登顶电影手册年度十佳 ', '58.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/2207106157205/O1CN01jIwTUO235wFMTFQTm_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616138655011&skuId=4611686634566042915&user_id=2207106157205&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('616170333022', '沙发图书馆人间世—波希米亚香港:沙发图书馆人间世:文娱读物(廖伟棠;9787301192269;北京大学出版社;27.00) ', '18.40', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3025552356/O1CN018IwTfn1TH5j7DGyyj_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616170333022&skuId=4611686634597720926&user_id=3025552356&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('616203781404', '沙发图书馆人间世—衣锦夜行:沙发图书馆人间世:文娱读物(廖伟棠;9787301190449;北京大学出版社;26.00) ', '17.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/3025552356/O1CN01Q6stsh1TH5j8oIQVp_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616203781404&skuId=4611686634631169308&user_id=3025552356&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('616207895253', '文娱产业知识产权保护实证研究 郝敏著 著 法学理论 社科 中国法律图书有限公司 河北新华 ', '66.20', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/1818151414/O1CN014hpScZ1MJed6yUa81_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616207895253&skuId=4611686634635283157&user_id=1818151414&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('616427986886', '沙发图书馆人间世—衣锦夜行:沙发图书馆人间世:文娱读物(廖伟棠;9787301190449;北京大学出版社;26.00) ', '17.70', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/645427271/O1CN01wkhi0P23aAO3xTxCZ_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616427986886&skuId=4611686634855374790&user_id=645427271&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('616585576440', '【张新成同款】格兰朵&德氏黑啤冰淇淋黑麦酒心网红雪糕5支*70g ', '25.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i4/4247178839/O1CN013T1z6J2FAJQG0KOxY_!!4247178839-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=616585576440&skuId=4524359407104&user_id=4247178839&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 17, 2);
INSERT INTO `goods_info`
VALUES ('616823813180', '超市购物篮金属购物篮手提篮购物篮KTV 酒吧铁篮子生鲜金属篮 ', '49.05', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i1/3031175103/O1CN01o1i34W1nZDiq1ysAh_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=616823813180&skuId=4523874267170&user_id=3031175103&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 0, 0);
INSERT INTO `goods_info`
VALUES ('617103452824', '文娱产业知识产权保护实证研究 郝敏著 法学理论 社科 中国法律图书有限公司 ', '67.00', '图书文娱_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/738499522/O1CN01U9KxxL2KD7w7TdyBu_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=617103452824&skuId=4611686635530840728&user_id=738499522&cat_id=2&is_b=1&rn=622dfba772be28f7d66f8c62f477188c',
        'TMALL', NULL, '2020-05-11 03:24:46', 0, 0);
INSERT INTO `goods_info`
VALUES ('617238415899', '松下led带灯化妆镜日光镜美妆灯美妆镜梳子灯泡小镜子随身镜C ', '299.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2207260630727/O1CN012vhdAL1HF0XSSL9TG_!!2207260630727.jpg',
        'https://detail.tmall.com/item.htm?id=617238415899&skuId=4522898707638&user_id=2207260630727&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 3, 0);
INSERT INTO `goods_info`
VALUES ('617239619269', 'Panasonic松下便携化妆镜日光镜美妆灯ins风网红小镜子LED化妆镜B ', '299.00', '美妆个护_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/2207260630727/O1CN01l58blM1HF0XMT2oYB_!!2207260630727.jpg',
        'https://detail.tmall.com/item.htm?id=617239619269&skuId=4519499454716&user_id=2207260630727&cat_id=2&is_b=1&rn=0116185e097f5d7887ae30087b9f761a',
        'TMALL', NULL, '2020-05-11 03:24:43', 0, 0);
INSERT INTO `goods_info`
VALUES ('617546325888', '餐饮服务员工作服女短袖t恤定制夏季酒店酒吧餐吧生鲜超市水果店 ', '62.00', '生鲜酒水_', '[]', '详情',
        'https://img.alicdn.com/bao/uploaded/i2/3158867450/O1CN01Vz2RMW24u9I1KpOz8_!!3158867450-0-lubanu-s.jpg',
        'https://detail.tmall.com/item.htm?id=617546325888&skuId=4359561065046&user_id=3158867450&cat_id=2&is_b=1&rn=b9295ef74de2114fcf476aab6bb72a99',
        'TMALL', NULL, '2020-05-11 03:24:45', 1, 0);
INSERT INTO `goods_info`
VALUES ('8641516803', '良良隔尿垫麻棉婴儿尿垫防水夏季透气可洗新生儿用品宝宝护理床垫 ', '76.00', '婴儿用品_宝宝用品',
        '[浴盆/洗发帽/水温计, 抱被/抱毯, 毛巾/手帕, 隔尿床垫, 婴儿剪刀/指甲钳, 童床/婴儿床/摇篮, 纱布尿布]', '详情',
        'https://img.alicdn.com/bao/uploaded/i3/628423076/O1CN01sc2O0r1YaqthW1d9C_!!0-item_pic.jpg',
        'https://detail.tmall.com/item.htm?id=8641516803&skuId=4502776051892&user_id=628423076&cat_id=2&is_b=1&rn=f06edfe357c2d54f86d3ff62d846147c',
        'TMALL', NULL, '2020-05-11 03:24:45', 11000, 62000);
COMMIT;

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

-- ----------------------------
-- Records of price_save
-- ----------------------------
BEGIN;
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-11 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-12 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-13 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-14 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-15 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-16 00:07:52', 169, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-17 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-18 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-19 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-20 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-21 00:07:52', 159, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-22 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-23 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-24 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-25 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-26 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-27 00:07:52', 169, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-28 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-29 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-04-30 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-01 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-02 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-03 00:07:52', 149, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-04 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-05 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-06 00:07:52', 139, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-07 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-08 00:07:52', 99, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-09 00:07:52', 179, NULL);
INSERT INTO `price_save`
VALUES ('587264705180', '2020-05-10 00:07:52', 179, NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`
(
    `user_id`    int NOT NULL AUTO_INCREMENT COMMENT '用户id',
    `user_count` varchar(11) DEFAULT NULL COMMENT '用户账号',
    `user_pwd`   varchar(30) DEFAULT NULL COMMENT '用户密码',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8 COMMENT ='用户';

SET FOREIGN_KEY_CHECKS = 1;
