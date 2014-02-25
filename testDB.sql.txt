DROP DATABASE trial;

CREATE DATABASE IF NOT EXISTS trial;
GRANT ALL PRIVILEGES ON trial.* to 'testuser'@'localhost' identified by 'password';
USE microBlogDB;

CREATE TABLE recipes
(
  name VARCHAR(25),
  ingredients TEXT,
  directions TEXT
);
  
INSERT INTO recipes VALUES ('Egg Salad', "Eggs, Salad","Put eggs in salad");
INSERT INTO recipes VALUES ('Ramen', "Noodles, Water","boil pasta in water");