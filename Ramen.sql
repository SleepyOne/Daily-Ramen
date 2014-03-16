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
  recipe_creator VARCHAR(15),
  recipe_rating INT,
  PRIMARY KEY (recipe_id)
);

INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Ramen', 'You can either put boiling water in the ramen or you can boil the noodles in the water.', 'Ian', 1);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Salad', 'Mix ingrediants in a large covered bowl then consume.', 'Ian', 2);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Grilled cheese', 'Butter bread, lightly toast bread, insert Kraft single. enjoy Could also add tomatoes for flavor', 'Ian', 3);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Mac and cheese', 'Boil water, add macoroni noodles, drain water once noodles are fully cooked, add cheese, enjoy.', 'Ian', 5);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Toast', 'Heat Bread in a toaster oven, enjoy.', 'Ian', 4);


CREATE TABLE ingredients
(
  ingredient_id INT NOT NULL AUTO_INCREMENT,
  ingredient_name VARCHAR(40)
  PRIMARY KEY (ingredient_id)
);

INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Cheese');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Water');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Bread');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Pasta');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Lettuce');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Chocolate');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Chicken');


CREATE TABLE users
(
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(25),
  password VARCHAR(25),
  PRIMARY KEY (user_id)
);
