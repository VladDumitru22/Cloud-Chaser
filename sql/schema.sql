CREATE DATABASE `cloud_chaser_db`;
USE `cloud_chaser_db`;

CREATE TABLE `clients` (
`id_client` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`email` VARCHAR(100) UNIQUE NOT NULL,
`phone_number` VARCHAR(20) NULL,
`address` VARCHAR(200) NULL,
`created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (`id_client`)
);

CREATE TABLE `products` (
`id_product` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`id_client` BIGINT UNSIGNED NOT NULL,
`name` VARCHAR(100) NOT NULL,
`start_date` DATE NOT NULL,
`end_date` DATE NOT NULL,
PRIMARY KEY (`id_product`),
CONSTRAINT `chk_product_dates` CHECK (`start_date` <= `end_date`)
);

CREATE TABLE `components` (
`id_component` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(100) NOT NULL,
`component_type` VARCHAR(50) NOT NULL,
`unit_cost` DECIMAL(10,2) NOT NULL,
`description` VARCHAR(150),
PRIMARY KEY (`id_component`)
);

CREATE TABLE `packages` (
`id_package` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`id_product` BIGINT UNSIGNED NOT NULL,
`id_component` BIGINT UNSIGNED NOT NULL,
`quantity` INT NOT NULL,
`notes` VARCHAR(200),
PRIMARY KEY (`id_package`)
);

CREATE TABLE `campaigns` (
`id_campaign` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
`id_product` BIGINT UNSIGNED NOT NULL,
`name` VARCHAR(100) NOT NULL,
`status` ENUM('Pending', 'Active', 'Completed') NOT NULL DEFAULT 'Pending',
`start_date` DATE NOT NULL,
`end_date` DATE NOT NULL,
PRIMARY KEY (`id_campaign`),
CONSTRAINT `chk_campaign_dates` CHECK (`start_date` <= `end_date`)
);

ALTER TABLE `products`
ADD CONSTRAINT `fk_product_client`
FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`)
ON DELETE CASCADE;

ALTER TABLE `packages`
ADD CONSTRAINT `fk_package_product`
FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`)
ON DELETE CASCADE;

ALTER TABLE `packages`
ADD CONSTRAINT `fk_package_component`
FOREIGN KEY (`id_component`) REFERENCES `components`(`id_component`)
ON DELETE CASCADE;

ALTER TABLE `campaigns`
ADD CONSTRAINT `fk_campaign_product`
FOREIGN KEY (`id_product`) REFERENCES `products`(`id_product`)
ON DELETE CASCADE;
