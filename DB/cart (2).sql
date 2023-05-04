

CREATE TABLE "cart" (
  "userID" int DEFAULT NULL,
  "prodID" int DEFAULT NULL,
  "nAdded" int DEFAULT NULL
);

--
-- Dump dei dati per la tabella "cart"
--

INSERT INTO "cart" ("userID", "prodID", "nAdded") VALUES
(9, 2, 1),
(9, 13, 17),
(9, 29, 1),
(9, 56, 1),
(1, 25, 1);
COMMIT;
