-- Buyosmly E-Commerce Database
CREATE DATABASE buyosmly;
-- Use Created Database
use buyosmly;

-- Create Tables

-- Supplier Table
CREATE TABLE `supplier` (
    `supp_id` int(11) NOT NULL AUTO_INCREMENT,
    `supp_name` varchar(50) NOT NULL,
    `supp_city` varchar(50) NOT NULL,
    `supp_phone` varchar(50) NOT NULL,
    PRIMARY KEY (`supp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Customer Table
CREATE TABLE `customer` (
    `cus_id` int(11) NOT NULL AUTO_INCREMENT,
    `cus_name` varchar(20) NOT NULL,
    `cus_phone` varchar(10) NOT NULL,
    `cus_city` varchar(30) NOT NULL,
    `cus_gender` char(1) DEFAULT NULL,
    PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Category Table
CREATE TABLE `category` (
    `cat_id` int(11) NOT NULL AUTO_INCREMENT,
    `cat_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Product Table
CREATE TABLE `product` (
    `pro_id` int(11) NOT NULL AUTO_INCREMENT,
    `pro_name` varchar(20) NOT NULL DEFAULT 'Dummy',
    `pro_desc` varchar(60) DEFAULT NULL,
    `cat_id` int(11) NOT NULL,
    PRIMARY KEY (`pro_id`),
    KEY `product_category_idx` (`cat_id`),
    CONSTRAINT `product_category` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Supplier Pricing Table
CREATE TABLE `supplier_pricing` (
    `pricing_id` int(11) NOT NULL AUTO_INCREMENT,
    `pro_id` int(11) NOT NULL,
    `supp_id` int(11) NOT NULL,
    `supp_price` int(11) DEFAULT '0',
    PRIMARY KEY (`pricing_id`),
    KEY `product_pricing_idx` (`pro_id`),
    KEY `product_supplier_idx` (`supp_id`),
    CONSTRAINT `product_pricing` FOREIGN KEY (`pro_id`) REFERENCES `product` (`pro_id`),
    CONSTRAINT `product_supplier` FOREIGN KEY (`supp_id`) REFERENCES `supplier` (`supp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Order Table
CREATE TABLE `order` (
     `ord_id` int(11) NOT NULL AUTO_INCREMENT,
     `ord_amount` int(11) NOT NULL,
     `ord_date` date NOT NULL,
     `cus_id` int(11) NOT NULL,
     `pricing_id` int(11) NOT NULL,
     PRIMARY KEY (`ord_id`),
     KEY `order_pricing_idx` (`pricing_id`),
     KEY `order_customer_idx` (`cus_id`),
     CONSTRAINT `order_customer` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`),
     CONSTRAINT `order_pricing` FOREIGN KEY (`pricing_id`) REFERENCES `supplier_pricing` (`pricing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Rating Table
CREATE TABLE `rating` (
    `rat_id` int(11) NOT NULL AUTO_INCREMENT,
    `ord_id` int(11) NOT NULL,
    `rat_ratstars` int(11) NOT NULL,
    PRIMARY KEY (`rat_id`),
    KEY `order_rating_idx` (`ord_id`),
    CONSTRAINT `order_rating` FOREIGN KEY (`ord_id`) REFERENCES `order` (`ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert Data into tables

-- Supplier Table
INSERT INTO `buyosmly`.`supplier`
(`supp_name`, `supp_city`, `supp_phone`)
VALUES
    ('Rajesh Retails', 'Delhi', '1234567890'),
    ('Appario Ltd.', 'Mumbai', '2589631470'),
    ('Knome products', 'Banglore', '9785462315'),
    ('Bansal Retails', 'Kochi', '8975463285'),
    ('Mittal Ltd.', 'Lucknow', '7898456532');

-- Customer Table
INSERT INTO `buyosmly`.`customer`
(`cus_name`,`cus_phone`,`cus_city`,`cus_gender`)
VALUES
    ( 'AAKASH', '9999999999', 'DELHI', 'M'),
    ( 'AMAN', '9785463215', 'NOIDA', 'M'),
    ( 'NEHA', '9999999999', 'MUMBAI', 'F'),
    ('MEGHA', '9994562399', 'KOLKATA', 'F'),
    ('PULKIT', '7895999999', 'LUCKNOW', 'M');

-- Category Table
INSERT INTO `buyosmly`.`category`
(`cat_id`,`cat_name`)
VALUES
    ('1', 'BOOKS'),
    ('2', 'GAMES'),
    ('3', 'GROCERIES'),
    ('4', 'ELECTRONICS'),
    ('5', 'CLOTHES');

-- Product Table
INSERT INTO `buyosmly`.`product`
(`pro_name`, `pro_desc`,`cat_id`)
VALUES
    ('GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', '2'),
    ('TSHIRT', 'SIZE-L with Black, Blue and White variations', '5'),
    ('ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', '4'),
    ('OATS', 'Highly Nutritious from Nestle', '3'),
    ('HARRY POTTER', 'Best Collection of all time by J.K Rowling', '1'),
    ('MILK', '1L Toned MIlk', '3'),
    ('Boat Earphones', '1.5Meter long Dolby Atmos', '4'),
    ('Jeans', 'Stretchable Denim Jeans with various sizes and color', '5'),
    ('Project IGI', 'compatible with windows 7 and above', '2'),
    ('Hoodie', 'Black GUCCI for 13 yrs and above', '5'),
    ('Rich Dad Poor Dad', 'Written by RObert Kiyosaki', '1'),
    ('Train Your Brain', 'By Shireen Stephen', '1');

-- Supplier Pricing Table
INSERT INTO `buyosmly`.`supplier_pricing`
(`pro_id`,
 `supp_id`,
 `supp_price`)
VALUES
    ('1', '2', '1500'),
    ('3', '5', '30000'),
    ('5', '1', '3000'),
    ('2', '3', '2500'),
    ('4', '1', '1000'),
    ('4', '1', '1000'),
    ('12','2','780'),
    ('12','4','789'),
    ('3','1','31000'),
    ('1','5','1450'),
    ('4','2','999'),
    ('7','3','549'),
    ('7','4','529'),
    ('6','2','105'),
    ('6','1','99'),
    ('2','5','2999'),
    ('5','2','2999');

-- Order Table
INSERT INTO `buyosmly`.`order`
(`ord_id`, `ord_amount`, `ord_date`, `cus_id`, `pricing_id`)
VALUES
    ('101', '1500', '2021-10-06', '2', '1'),
    ('102', '1000', '2021-10-12', '3', '5'),
    ('103', '30000', '2021-09-16', '5', '2'),
    ('104', '1500', '2021-10-05', '1', '1'),
    ('105', '3000', '2021-08-16', '4', '3'),
    ('106', '1450', '2021-08-18', '1', '9'),
    ('107', '789', '2021-09-01', '3', '7'),
    ('108', '780', '2021-09-07', '5', '6'),
    ('109', '3000', '2021-00-10', '5', '3'),
    ('110', '2500', '2021-09-10', '2', '4'),
    ('111', '1000', '2021-09-15', '4', '5'),
    ('112', '789', '2021-09-16', '4', '7'),
    ('113', '31000', '2021-09-16', '1', '8'),
    ('114', '1000', '2021-09-16', '3', '5'),
    ('115', '3000', '2021-09-16', '5', '3'),
    ('116', '99', '2021-09-17', '2', '14');

-- Rating Table
INSERT INTO `buyosmly`.`rating`
(`rat_id`,
 `ord_id`,
 `rat_ratstars`)
VALUES
    ('1', '101', '4'),
    ('2', '102', '3'),
    ('3', '103', '1'),
    ('4', '104', '2'),
    ('5', '105', '4'),
    ('6', '106', '3'),
    ('7', '107', '4'),
    ('8', '108', '4'),
    ('9', '109', '3'),
    ('10', '110', '5'),
    ('11', '111', '3'),
    ('12', '112', '4'),
    ('13', '113', '2'),
    ('14', '114', '1'),
    ('15', '115', '1'),
    ('16', '116', '0');

-- Question 3

SELECT
    (SELECT
         c.cus_gender
     FROM
         `buyosmly`.`customer` AS c
     WHERE
             c.cus_id = o.cus_id) AS gender,
    COUNT(distinct o.cus_id) AS customer_count

FROM
    `buyosmly`.`order` AS o
WHERE
        o.ord_amount >= 3000
GROUP BY gender;

-- Output
-- M -> 2
-- F -> 1

-- Question 4

SELECT
    *,
    (SELECT
         (SELECT
              p.pro_name
          FROM
              `buyosmly`.`product` AS p
          WHERE
                  p.pro_id = sp.pro_id)
     FROM
         `buyosmly`.`supplier_pricing` AS sp
     WHERE
             sp.pricing_id = o.pricing_id) AS product
FROM
    `buyosmly`.`order` AS o
WHERE
        o.cus_id = 2;

-- Output
-- ord_id, ord_amount, ord_date, cus_id, pricing_id, product
-- '101', '1500', '2021-10-06', '2', '1', 'GTA V'
-- '110', '2500', '2021-09-10', '2', '4', 'TSHIRT'
-- '116', '99', '2021-09-17', '2', '14', 'MILK'

-- Question 5

SELECT
    *,
    (SELECT
         COUNT(DISTINCT sp.pro_id)
     FROM
         `buyosmly`.`supplier_pricing` AS sp
     WHERE
             sp.supp_id = s.supp_id) AS products
FROM
    `buyosmly`.`supplier` AS s
HAVING products > 1;

-- Output
-- supp_id, supp_name, supp_city, supp_phone, products
-- '1', 'Rajesh Retails', 'Delhi', '1234567890', '4'
-- '2', 'Appario Ltd.', 'Mumbai', '2589631470', '5'
-- '3', 'Knome products', 'Banglore', '9785462315', '2'
-- '4', 'Bansal Retails', 'Kochi', '8975463285', '2'
-- '5', 'Mittal Ltd.', 'Lucknow', '7898456532', '3'

-- Question 6
SELECT
    (SELECT
         (SELECT
              c.cat_id
          FROM
              `buyosmly`.`category` c
          WHERE
                  c.cat_id = p.cat_id)
     FROM
         `buyosmly`.`product` p
     WHERE
             p.pro_id = sp.pro_id) AS cat_id,
    (SELECT
         (SELECT
              c.cat_name
          FROM
              `buyosmly`.`category` c
          WHERE
                  c.cat_id = p.cat_id)
     FROM
         `buyosmly`.`product` p
     WHERE
             p.pro_id = sp.pro_id) AS category,
    (SELECT
         p.pro_name
     FROM
         `buyosmly`.`product` p
     WHERE
             p.pro_id = sp.pro_id) AS product,
    MIN(supp_price) AS product_price
FROM
    `buyosmly`.`supplier_pricing` AS sp
GROUP BY category
order by cat_id ASC;

-- Output
-- cat_id cat_name, product, product_price
-- '1', 'BOOKS', 'HARRY POTTER', '780'
-- '2', 'GAMES', 'GTA V', '1450'
-- '3', 'GROCERIES', 'OATS', '99'
-- '4', 'ELECTRONICS', 'ROG LAPTOP', '529'
-- '5', 'CLOTHES', 'TSHIRT', '2500'



-- Question 7

SELECT
    (SELECT
         sp.pro_id
     FROM
         `buyosmly`.`supplier_pricing` AS sp
     WHERE
             sp.pricing_id = o.pricing_id) as pro_id,
    (SELECT
         (SELECT
              p.pro_name
          FROM
              `buyosmly`.`product` AS p
          WHERE
                  p.pro_id = sp.pro_id)
     FROM
         `buyosmly`.`supplier_pricing` AS sp
     WHERE
             sp.pricing_id = o.pricing_id) AS product
FROM
    `buyosmly`.`order` AS o
WHERE
    date(o.ord_date) > '2021-10-05';

-- Output
-- pro_id, product
-- '1', 'GTA V'
-- '4', 'OATS'

-- Question 8

SELECT
    c.cus_name,
    c.cus_gender
FROM
    `buyosmly`.`customer` AS c
WHERE
        c.cus_name LIKE '%a'
   OR c.cus_name LIKE 'a%';

-- Output
-- cus_name, cus_gender
-- 'AAKASH', 'M'
-- 'AMAN', 'M'
-- 'NEHA', 'F'
-- 'MEGHA', 'F'

-- Question 9

DELIMITER &&
CREATE PROCEDURE `GetSupplierRatings` ()
BEGIN
SELECT
    sp.supp_id,
    (SELECT s.supp_name FROM `buyosmly`.`supplier` as s where s.supp_id=sp.supp_id) as supp_name,
    (sum(r.rat_ratstars)/count(r.rat_ratstars) ) as average_rating,
    (CASE
         WHEN (sum(r.rat_ratstars)/count(r.rat_ratstars) ) = 5 THEN 'Excellent Service'
         WHEN (sum(r.rat_ratstars)/count(r.rat_ratstars) ) > 4 THEN 'Good Service'
         WHEN (sum(r.rat_ratstars)/count(r.rat_ratstars) ) > 2 THEN 'Average Service'
         ELSE 'Poor Service'
        END) as type_of_service

FROM
    `buyosmly`.`rating` AS r
        INNER JOIN
    `buyosmly`.`order` as o
    ON r.ord_id = o.ord_id
        INNER JOIN
    `buyosmly`.`supplier_pricing` as sp
    ON sp.pricing_id = o.pricing_id
group by sp.supp_id
order by supp_id ASC;
END &&
DELIMITER ;

CALL `buyosmly`.`GetSupplierRatings`();

-- Output
-- supp_id, supp_name, average_rating, type_of_service
-- '1', 'Rajesh Retails', '2.7500', 'Average Service'
-- '2', 'Appario Ltd.', '2.8000', 'Average Service'
-- '3', 'Knome products', '5.0000', 'Excellent Service'
-- '4', 'Bansal Retails', '2.0000', 'Poor Service'
-- '5', 'Mittal Ltd.', '1.0000', 'Poor Service'


