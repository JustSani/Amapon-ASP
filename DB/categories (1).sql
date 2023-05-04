


CREATE TABLE "categories" (
  "id" int DEFAULT NULL,
  "mid" int DEFAULT NULL,
  "name" varchar(25) DEFAULT NULL,
  "description" varchar(25) DEFAULT NULL
);

--
-- Dump dei dati per la tabella "categories"
--

INSERT INTO "categories" ("id", "mid", "name", "description") VALUES
(1, 1, 'Laptops', 'Laptops'),
(2, 1, 'Tablets', 'Tablets'),
(3, 1, 'Desktop', 'Desktop Computers'),
(4, 1, 'Screens', 'Screens'),
(5, 1, 'Components', 'Components'),
(6, 2, 'Top', 'Top Sellers'),
(7, 2, 'Fiction', 'Fiction'),
(8, 2, 'Fantasy', 'Fantasy'),
(9, 2, 'Horror', 'Horror'),
(10, 2, 'Romance', 'Romance'),
(11, 3, 'Clothes', 'Clothes'),
(12, 3, 'Shoes', 'Shoes'),
(13, 3, 'Accessories', 'Accessories'),
(14, 3, 'Watches', 'Watches'),
(15, 4, 'Kitchen', 'Kitchen'),
(16, 4, 'Furniture', 'Furniture'),
(17, 4, 'Bath', 'Bath'),
(18, 4, 'Cleaning', 'Cleaning Supplies'),
(19, 4, 'Bedroom', 'Bedroom'),
(20, 4, 'Decoration', 'Wall Art & Decoration'),
(22, 4, 'Lightning', 'Lightning'),
(23, 5, 'Toys', 'Toys'),
(24, 5, 'Board', 'Board Games'),
(25, 5, 'Outdoors', 'Outdoors games'),
(26, 5, 'Dolls', 'Dolls'),
(27, 6, 'Skin-care', 'Skin care'),
(28, 6, 'Make-up', 'Make up'),
(29, 6, 'Lotions', 'Lotions'),
(30, 6, 'Shampoo', 'Shampoo'),
(31, 6, 'Cologne', 'Cologne'),
(32, 7, 'Food', 'Food'),
(33, 7, 'Drinks', 'Drinks');
COMMIT;

