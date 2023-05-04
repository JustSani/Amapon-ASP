
CREATE TABLE "users" (
  "userID" int NOT NULL,
  "username" varchar(30) NOT NULL,
  "password" varchar(30) NOT NULL,
  "type" varchar(3) NOT NULL,
  "wallet" int NOT NULL,
  "email" varchar(25) DEFAULT NULL,
  "Name" varchar(25) DEFAULT NULL,
  "Surname" varchar(25) DEFAULT NULL,
  "profilePicture" varchar(25) NOT NULL
);

INSERT INTO "users" ("userID", "username", "password", "type", "wallet", "email", "Name", "Surname", "profilePicture") VALUES
(0, 'Amministratore', 'password', 'ADM', 99999999, 'fabiosanino@gmail.com', 'Fabio', 'Sanino', 'images.jfif'),
(1, 'customer', 'customer', 'USR', 171948939, 'fabiosanino@gmail.com', 'Fabio', 'Sanino', 'cologne.jpeg'),
(2, 'ChadGabbo', 'password', 'ADM', 99, NULL, 'Gabriele', 'Chad', 'cacca.jpeg'),
(3, 'LaMamma', 'password', 'ADM', 99, NULL, 'Marina', 'Gigliotti', 'mamma.jpeg'),
(4, 'Paul', 'password', 'USR', 988262, NULL, 'Paolo', 'Bruno', 'uccio.png'),
(5, 'Mattia', 'password', 'USR', 999999, NULL, 'Mattia', 'Manca', 'ac.jpg'),
(6, 'SoPazzo', 'password', 'USR', 999926631, NULL, 'Compratore', 'Seriale', 'mamma.jpeg'),
(7, 'admin', 'admin', 'ADM', 999999, 'admin@gmail.com', 'admin', 'admin', 'default.jpg');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle "users"
--
ALTER TABLE "users"
  ADD PRIMARY KEY ("userID");
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
