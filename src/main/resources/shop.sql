CREATE DATABASE  IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8;

USE `shop`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` ( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `name` VARCHAR(64) NOT NULL , 
  `password` VARCHAR(128) NOT NULL,
  `type` TINYINT  NOT NULL COMMENT '1是商户,0是消费者',  
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# ticket表
DROP TABLE IF EXISTS `login_ticket`;
  CREATE TABLE `login_ticket` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `ticket` VARCHAR(45) NOT NULL,
    `expired` DATETIME NOT NULL,
    `status` INT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `ticket_UNIQUE` (`ticket` ASC),
    UNIQUE (`user_id`), 
    CONSTRAINT `ticket_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# commodity 商品表

DROP TABLE IF EXISTS `commodity`;
CREATE TABLE `commodity` ( 
  `id` INT NOT NULL AUTO_INCREMENT, 
  `com_code` VARCHAR(64) NOT NULL COMMENT '商品编号',
  `title` VARCHAR(80) NOT NULL COMMENT '标题',
  `abstract` VARCHAR(140) NOT NULL COMMENT '简要描述',
  `per_price`  DECIMAL(10,2) NOT NULL COMMENT '商品单价',
  `detail` VARCHAR(1000) NOT NULL COMMENT '商品正文信息',
  `pic_uri`  VARCHAR(150) NOT NULL COMMENT '图片资源路径',
  `pic_type` TINYINT  NOT NULL COMMENT '1是URL,0是本地', 
  `publisher_id` INT NOT NULL COMMENT '商品的发布商家id',
  `pub_time` DATETIME NOT NULL COMMENT '商品的发布日期',
  `storage_amount` INT DEFAULT 1000  COMMENT '商品库存储备量,默认1000',
  `sold_quantity` INT DEFAULT 0 COMMENT '商品已售数量 默认值0',
  `pub_status` TINYINT DEFAULT 0 COMMENT '商品的状态，0：未发布,1：已发布，2：已删除',
  PRIMARY KEY (`id`),
  INDEX `pub_time_index` (`pub_time` ASC) COMMENT '按照发布时间降序建立索引',
  CONSTRAINT `commodity_fk` FOREIGN KEY (`publisher_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# order 订单表

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` ( 
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_number` VARCHAR(64) NOT NULL COMMENT '订单编号',
  `com_id`  INT NOT NULL COMMENT '商品id',
  `com_title` VARCHAR(80) NOT NULL COMMENT '商品名称',
  `com_pic_uri` VARCHAR(150) NOT NULL COMMENT '商品图片资源路径',
  `com_quantity`  INT NOT NULL COMMENT '商品数量',
  `pay_status` TINYINT  NOT NULL COMMENT '0：提交订单未支付,,1：订单取消，2：订单完成支付', 
  `per_price_snapshot`  DECIMAL(10,2) NOT NULL COMMENT '商品单价快照，Note：配合支付时限，比如30分钟，否则的话，订单的价格在支付完成之前还会发生变化',
  `pay_time` DATETIME NOT NULL  COMMENT '订单支付完成时间',
  `create_time` DATETIME NOT NULL  COMMENT '订单创建时间',
  `creator_id`  INT NOT NULL COMMENT '订单的创建者',
  PRIMARY KEY (`id`),
  INDEX `create_time_index` (`create_time` ASC) COMMENT '按照订单建立时间降序建立索引',
  INDEX `pay_time_index` (`pay_time` ASC) COMMENT '按照订单支付的时间降序建立索引',
  CONSTRAINT `orders_fk1` FOREIGN KEY (`com_id`) REFERENCES `commodity` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT `orders_fk2` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;




