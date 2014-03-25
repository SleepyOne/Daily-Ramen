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
  ingredient_name VARCHAR(40),
  PRIMARY KEY (ingredient_id)
);

INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Cheese');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Water');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Bread');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Pasta');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Lettuce');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Chocolate');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Chicken');


CREATE TABLE recipeIngredients
(
    recipe_id int NOT NULL,
    ingredient_id int NOT NULL,
    CONSTRAINT PK_recipeIngredients PRIMARY KEY
    (
        recipe_id,
        ingredient_id
    ),
    FOREIGN KEY (recipe_id) REFERENCES recipes (recipe_id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (ingredient_id)
);

insert into recipeIngredients values
(1,2), (1,5), (1,7),
(2,4), (2,1), (2,6),
(3,1),(3,3),
(4,1),(4,4),
(5,3);



CREATE TABLE users
(
  user_id INT NOT NULL AUTO_INCREMENT,
  user_name VARCHAR(25),
  password VARCHAR(25),
  PRIMARY KEY (user_id)
);

CREATE TABLE comments
(
  comment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  comment TEXT,
  recipe_id INT NOT NULL/*,
  CONSTRAINT recipe_recipe_id_fk
  FOREIGN KEY (recipe_id)
  REFERENCES recipe (recipe_id)*/
);

insert into comments values
(NULL,'Do NOT try ading tomatoes. Worst mistake of my life. Of course, I was using nuclear tomatoes...',1);
