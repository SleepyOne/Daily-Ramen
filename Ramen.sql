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

INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES (NULL,'Ramen', 'You can either put boiling water in the ramen or you can boil the noodles in the water.', "Ramen, Water", 'Ian', 1);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES (NULL,'Salad', 'Mix ingrediants in a large covered bowl then consume.', "Salad, tomatoes", 'Ian', 2);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES (NULL,'Grilled cheese', 'Butter bread, lightly toast bread, insert Kraft single. enjoy Could also add tomatoes for flavor', "Bread, Cheese, tomatoes", 'Ian', 3);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES (NULL,'Mac and cheese', 'Boil water, add macoroni noodles, drain water once noodles are fully cooked, add cheese, enjoy.', "Macaroni, Cheese, Water", 'Ian', 5);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_ingredients, recipe_creator, recipe_rating) VALUES (NULL,'Toast', 'Heat Bread in a toaster oven, enjoy.', "Bread", 'Ian', 4);
