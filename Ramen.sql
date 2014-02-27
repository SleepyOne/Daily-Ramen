DROP DATABASE RamenDB;

CREATE DATABASE IF NOT EXISTS RamenDB;
GRANT ALL PRIVILEGES ON RamenDB.* to 'RamenMaster'@'localhost' 
identified by 'RamenPassword';
USE RamenDB;


CREATE TABLE recipes
(
  recipe_id INT NOT NULL AUTO_INCREMENT,
  recipe_name VARCHAR(25),
  recipe_instructions TEXT,
  recipe_ingredients TEXT,
  recipe_creator VARCHAR(15),
  recipe_rating INT,
  PRIMARY KEY (recipe_id)
);


INSERT INTO recipes (recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES ('Ramen', 'You can either put boiling water in the ramen or you can boil the noodles in the water.' "Ramen, Water", 'Ian', 1);
INSERT INTO recipes (recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES ('Salad', 'Mix ingrediants in a large covered bowl then consume.' "Salad", 'Ian', 2);
