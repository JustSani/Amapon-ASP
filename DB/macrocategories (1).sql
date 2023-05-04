


CREATE TABLE "macrocategories" (
  "catID" int DEFAULT NULL,
  "name" varchar(25) DEFAULT NULL,
  "description" varchar(25) DEFAULT NULL
);

INSERT INTO "macrocategories" ("catID", "name", "description") VALUES
(1, 'Technology', 'Technology & Computers'),
(2, 'Books', 'Books'),
(3, 'Clothing', 'Clothing & Accessories'),
(4, 'Home', 'Home & Kitchen'),
(5, 'Games', 'Games & Toys'),
(6, 'Health', 'Health & Beauty'),
(7, 'Food', 'Food & Drinks');
COMMIT;

