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
  PRIMARY KEY (recipe_id),
  INDEX recipe_index (recipe_name)
);


INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Ramen', 'You can either put boiling water in the ramen or you can boil the noodles in the water.', 'Ian', 1);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Salad', 'Mix ingrediants in a large covered bowl then consume.', 'Ian', 2);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Grilled cheese', 'Butter bread, lightly toast bread, insert Kraft single. enjoy Could also add tomatoes for flavor', 'Ian', 3);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Mac and cheese', 'Boil water, add macoroni noodles, drain water once noodles are fully cooked, add cheese, enjoy.', 'Ian', 5);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Toast', 'Heat Bread in a toaster oven, enjoy.', 'Ian', 4);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Waffles', 'Pour batter into waffle iron and wait until the alarm sounds.', 'Ian', 5);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Pancakes', 'Pour batter into stovetop pan and cook until golden brown.', 'Ian', 6);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Pizza', 'Top the dough with any desired ingredients and bake at 450 degrees until crust is golden brown.', 'Ian', 7);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Eggs', 'Pour scrambled eggs into stovetop pan and cook until they become solid.', 'Ian', 8);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Hamburger', 'Throw onto grill and flip repeatedly until the inside is no longer red and bloody.', 'Ian', 9);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Flan', 'Do not try to make this, because it is too complicated and disgusting.', 'Ian', 10);
INSERT INTO recipes (recipe_id, recipe_name, recipe_instructions, recipe_creator, recipe_rating) VALUES (NULL,'Apples', 'Spread peanut butter on cut up apple slices and enjoy.', 'Ian', 11);


CREATE TABLE ingredients
(
  ingredient_id INT NOT NULL AUTO_INCREMENT,
  ingredient_name VARCHAR(40),
  PRIMARY KEY (ingredient_id),
  Index recipe_index (ingredient_name)
);

INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Cheese');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Water');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Bread');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Pasta');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Lettuce');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Chocolate');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Egg');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Apple');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Peanut butter');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Dough');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Pepperoni');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Suger');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Flour');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Salt');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Butter');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Tomato sauce');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Banana');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Nutella');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Noodles');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Caramel');
INSERT INTO ingredients (ingredient_id, ingredient_name) VALUES (NULL, 'Beef');


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
(NULL,'Do NOT try ading tomatoes. Worst mistake of my life. Of course, I was using nuclear tomatoes...',1),
(NULL,'Does anyone know why my vegetarian girlfriend punched me when I attempted to make this recipe?',2),
(NULL,'For an extra kick, add bacon!',3),
(NULL,'First!',4),
(NULL,'Can anyone offer me advice? I think myy toaster only goes up to 5 degrees. What is the temperature equivilant for the Bagel setting?',5);
