CREATE TABLE Ages ( 
  name VARCHAR(128), 
  age INTEGER
);


INSERT INTO Ages (name, age) VALUES ('Malakai', 16);
INSERT INTO Ages (name, age) VALUES ('Chelsey', 17);
INSERT INTO Ages (name, age) VALUES ('Bushra', 39);
INSERT INTO Ages (name, age) VALUES ('Clare', 32);
INSERT INTO Ages (name, age) VALUES ('Pamela', 24);
INSERT INTO Ages (name, age) VALUES ('Hamzah', 35);

SELECT sha1(CONCAT(name,age)) AS X FROM Ages ORDER BY X