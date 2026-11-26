CREATE TABLE `Products`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Code` INT NOT NULL,
    `Name` VARCHAR(255) NOT NULL,
    `Price` DECIMAL(8, 2) NOT NULL,
    `Entry date` DATE NOT NULL,
    `Brand` VARCHAR(255) NOT NULL,
    `Stock available` INT NOT NULL
);
ALTER TABLE
    `Products` ADD UNIQUE `products_code_unique`(`Code`);
CREATE TABLE `Invoices`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Invoice Number` BIGINT NOT NULL,
    `Purchase date` DATE NOT NULL,
    `Total amount` DECIMAL(8, 2) NOT NULL,
    `id_user` INT UNSIGNED NULL,
    `buyer_email` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Invoices` ADD UNIQUE `invoices_invoice number_unique`(`Invoice Number`);
CREATE TABLE `products_per_invoice`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Quantity` INT NOT NULL,
    `Total amount` DECIMAL(8, 2) NOT NULL,
    `id_product` INT UNSIGNED NOT NULL,
    `id_invoice` INT UNSIGNED NOT NULL
);
CREATE TABLE `shopping_cart`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Buyer Email` VARCHAR(255) NOT NULL
);
CREATE TABLE `product_shopping_cart`(
    `id_product` INT UNSIGNED NOT NULL,
    `id_shopping_cart` INT UNSIGNED NOT NULL,
    `Quantity` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `product_shopping_cart` ADD UNIQUE `product_shopping_cart_id_product_id_shopping_cart_unique`(`id_product`, `id_shopping_cart`);
CREATE TABLE `Users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Full name` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `Registration date` DATE NOT NULL
);
ALTER TABLE
    `Users` ADD UNIQUE `users_email_unique`(`Email`);
CREATE TABLE `Reviews`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Comment` VARCHAR(255) NOT NULL,
    `Rating` INT UNSIGNED NOT NULL COMMENT 'Rango de 1-5',
    `Date` DATE NOT NULL,
    `id_user` INT UNSIGNED NOT NULL,
    `id_product` INT UNSIGNED NOT NULL
);
CREATE TABLE `payment_methods`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `method_type` VARCHAR(255) NOT NULL,
    `bank_name` VARCHAR(255) NULL
);
CREATE TABLE `invoice_payment`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_payment` INT UNSIGNED NOT NULL,
    `id_invoice` INT UNSIGNED NOT NULL,
    `Amount` DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    `Invoices` ADD CONSTRAINT `invoices_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `Users`(`id`);
ALTER TABLE
    `Reviews` ADD CONSTRAINT `reviews_id_user_foreign` FOREIGN KEY(`id_user`) REFERENCES `Users`(`id`);
ALTER TABLE
    `product_shopping_cart` ADD CONSTRAINT `product_shopping_cart_id_shopping_cart_foreign` FOREIGN KEY(`id_shopping_cart`) REFERENCES `shopping_cart`(`id`);
ALTER TABLE
    `products_per_invoice` ADD CONSTRAINT `products_per_invoice_id_invoice_foreign` FOREIGN KEY(`id_invoice`) REFERENCES `Invoices`(`id`);
ALTER TABLE
    `products_per_invoice` ADD CONSTRAINT `products_per_invoice_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `Products`(`id`);
ALTER TABLE
    `invoice_payment` ADD CONSTRAINT `invoice_payment_id_invoice_foreign` FOREIGN KEY(`id_invoice`) REFERENCES `Invoices`(`id`);
ALTER TABLE
    `Reviews` ADD CONSTRAINT `reviews_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `Products`(`id`);
ALTER TABLE
    `product_shopping_cart` ADD CONSTRAINT `product_shopping_cart_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `Products`(`id`);
ALTER TABLE
    `invoice_payment` ADD CONSTRAINT `invoice_payment_id_payment_foreign` FOREIGN KEY(`id_payment`) REFERENCES `payment_methods`(`id`);