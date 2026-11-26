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
    `Buyer email` VARCHAR(255) NOT NULL,
    `Total amount` DECIMAL(8, 2) NOT NULL
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
ALTER TABLE
    `product_shopping_cart` ADD CONSTRAINT `product_shopping_cart_id_shopping_cart_foreign` FOREIGN KEY(`id_shopping_cart`) REFERENCES `shopping_cart`(`id`);
ALTER TABLE
    `products_per_invoice` ADD CONSTRAINT `products_per_invoice_id_invoice_foreign` FOREIGN KEY(`id_invoice`) REFERENCES `Invoices`(`id`);
ALTER TABLE
    `products_per_invoice` ADD CONSTRAINT `products_per_invoice_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `Products`(`id`);
ALTER TABLE
    `product_shopping_cart` ADD CONSTRAINT `product_shopping_cart_id_product_foreign` FOREIGN KEY(`id_product`) REFERENCES `Products`(`id`);