CREATE DATABASE Meal_Deliveries_DB;

USE Meal_Deliveries_DB;

CREATE TABLE Meals
(MealID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
MainIngredient VARCHAR(50) NOT NULL,
IngredientTwo VARCHAR(50) NOT NULL,
IngredientThree VARCHAR(50) NOT NULL);

INSERT INTO Meals
(MainIngredient, IngredientTwo, IngredientThree)
VALUES
('Mushroom', 'Thyme', 'Garlic'),
('Mushroom', 'Butter', 'Sage'),
('Mushroom', 'Onion', 'Rosemary'),
('Tomato', 'Basil', 'Mozzarella Cheese'),
('Tomato', 'Olive Oil', 'Garlic'),
('Tomato', 'Balsamic Vinegar', 'Red Onion'),
('Banana', 'Peanut Butter', 'Honey'),
('Banana', 'Chocolate Chips', 'Almond Milk'),
('Banana', 'Greek Yogurt', 'Strawberries'),
('Salmon', 'Dill', 'Lemon'),
('Salmon', 'Garlic', 'Butter'),
('Salmon', 'Honey', 'Soy Sauce'),
('Eggs', 'Spinach', 'Feta Cheese'),
('Eggs', 'Avocado', 'Tomato'),
('Eggs', 'Smoked Salmon', 'Cream Cheese'),
('Chicken', 'Rosemary', 'Lemon'),
('Chicken', 'Garlic', 'Butter'),
('Chicken', 'Honey', 'Mustard'),
('Beef', 'Garlic', 'Rosemary'),
('Beef', 'Mushroom', 'Thyme'),
('Beef', 'Red Wine', 'Shallots'),
('Avocado', 'Tomato', 'Lime'),
('Avocado', 'Cilantro', 'Red Onion'),
('Avocado', 'Feta Cheese', 'Olive Oil'),
('Lemon', 'Garlic', 'Olive Oil'),
('Lemon', 'Rosemary', 'Chicken'),
('Lemon', 'Basil', 'Tomato'),
('Potato', 'Rosemary', 'Garlic'),
('Potato', 'Olive Oil', 'Thyme'),
('Potato', 'Parmesan Cheese', 'Broccoli');

SELECT * FROM Meals;

CREATE TABLE Customers
(CustomerID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Address VARCHAR(100),
PhoneNumber VARCHAR(50));

INSERT INTO Customers
(FirstName, LastName, Address, PhoneNumber)
VALUES
('Steve', 'Small', '123 Notreal Road', '07123456789'),
('Lucy', 'Jones', '124 Notreal Road', '07234567891'),
('Catherine', 'Taylor', '456 Madeup Street', '07345678912'),
('Jack', 'Smith', '78 Fake Avenue', '07456789123'),
('Emily', 'Johnson', '9 Pretend Lane', '07567891234');

SELECT * FROM Customers;

CREATE TABLE IngredientCosts
(Ingredient VARCHAR(50) NOT NULL,
Cost DECIMAL(5,2));

INSERT INTO IngredientCosts
(Ingredient, Cost)
VALUES
('Mushroom', 0.90),
('Tomato', 0.60),
('Banana', 0.40),
('Salmon', 2.20),
('Eggs', 1.30),
('Chicken', 3.50),
('Beef', 4),
('Avocado', 1.60),
('Lemon', 0.50),
('Potato', 0.50),
('Thyme', 0.60),
('Butter', 2.10),
('Onion', 0.80),
('Basil', 0.80),
('Olive Oil', 1.20),
('Balsamic Vinegar', 1.40),
('Peanut Butter', 3),
('Chocolate Chips', 2.50),
('Greek Yogurt', 1.40),
('Dill', 0.70),
('Garlic', 0.25),
('Honey', 1.20),
('Spinach', 1),
('Smoked Salmon', 2.50),
('Rosemary', 0.70),
('Red Wine', 6),
('Cilantro', 0.60),
('Feta Cheese', 1.20),
('Parmesan Cheese', 1.30),
('Sage', 0.70),
('Mozzarella Cheese', 1.50),
('Red Onion', 0.80),
('Almond Milk', 1.20),
('Strawberries', 1.50),
('Soy Sauce', 2),
('Cream Cheese', 1.30),
('Mustard', 1),
('Shallots', 1.10),
('Lime', 0.50),
('Broccoli', 0.80);

#changes the name of an ingredient
UPDATE Meals
SET 
  MainIngredient = REPLACE(MainIngredient, 'Cilantro', 'Coriander'),
  IngredientTwo = REPLACE(IngredientTwo, 'Cilantro', 'Coriander'),
  IngredientThree = REPLACE(IngredientThree, 'Cilantro', 'Coriander');

UPDATE IngredientCosts
SET Ingredient = 'Coriander'
WHERE Ingredient = 'Cilantro';

ALTER TABLE IngredientCosts
ADD PRIMARY KEY (Ingredient);

ALTER TABLE Meals
ADD CONSTRAINT
FOREIGN KEY (MainIngredient)
REFERENCES IngredientCosts(Ingredient);

ALTER TABLE Meals
ADD CONSTRAINT
FOREIGN KEY (IngredientTwo)
REFERENCES IngredientCosts(Ingredient);

ALTER TABLE Meals
ADD CONSTRAINT
FOREIGN KEY (IngredientThree)
REFERENCES IngredientCosts(Ingredient);

SELECT * FROM IngredientCosts;

CREATE TABLE FavouriteIngredients
(CustomerID INT,
Ingredient VARCHAR(50));

INSERT INTO FavouriteIngredients
(CustomerID, Ingredient)
VALUES
(1, 'Mushroom'),
(2, 'Lemon'),
(3, 'Tomato'),
(4, 'Chicken'),
(5, 'Potato');

ALTER TABLE FavouriteIngredients
ADD CONSTRAINT
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

SELECT * FROM FavouriteIngredients;

CREATE TABLE Orders
(OrderID INT NOT NULL,
OrderDate DATE NOT NULL,
CustomerID INT NOT NULL,
MealOrdered INT NOT NULL);

INSERT INTO Orders
(OrderID, OrderDate, CustomerID, MealOrdered)
VALUES
(1, '2023-12-15', 2, 14),
(1, '2023-12-15', 2, 3),
(2, '2023-12-23', 5, 3),
(3, '2023-12-27', 1, 30),
(4, '2023-12-28', 3, 23),
(4, '2023-12-28', 3, 24),
(5, '2023-12-30', 4, 29),
(6, '2024-01-02', 1, 15),
(7, '2024-01-04', 3, 14),
(8, '2024-01-05', 5, 14);

ALTER TABLE Orders
ADD CONSTRAINT
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID),
ADD CONSTRAINT
FOREIGN KEY (MealOrdered)
REFERENCES Meals(MealID);

SELECT * FROM Orders;

#finds orders where a customer ordered a meal containing their favourite ingredient
SELECT
    O.OrderID,
    O.OrderDate,
    C.FirstName,
    C.LastName,
    M.MainIngredient,
    M.IngredientTwo,
    M.IngredientThree
FROM
    Orders O
JOIN
    Customers C ON O.CustomerID = C.CustomerID
JOIN
    Meals M ON O.MealOrdered = M.MealID
JOIN
    FavouriteIngredients FI ON O.CustomerID = FI.CustomerID
WHERE
    M.MainIngredient = FI.Ingredient
    OR M.IngredientTwo = FI.Ingredient
    OR M.IngredientThree = FI.Ingredient;
 
#finds meals containing a customer's favourite ingredient from the meals table to recommend to them
SELECT
    C.FirstName,
    C.LastName,
    FI.Ingredient AS FavouriteIngredient,
    M.MealID AS RecommendedMeal,
    M.MainIngredient,
    M.IngredientTwo,
    M.IngredientThree
FROM
    Customers C
JOIN
    FavouriteIngredients FI ON C.CustomerID = FI.CustomerID
JOIN
    Meals M ON
        M.MainIngredient = FI.Ingredient
        OR M.IngredientTwo = FI.Ingredient
        OR M.IngredientThree = FI.Ingredient;
        
#finds the name of the customer who's favourite ingredient is chicken
SELECT FirstName, LastName FROM Customers
WHERE CustomerID = (
SELECT CustomerID FROM FavouriteIngredients
WHERE Ingredient = 'Chicken');

ALTER TABLE Meals
ADD COLUMN Cost DECIMAL(5,2);

SET sql_safe_updates = 0;

#adds costs of meals to meals table
UPDATE Meals M
SET Cost = (
    SELECT SUM(IC.Cost)
    FROM IngredientCosts IC
    WHERE IC.Ingredient IN (M.MainIngredient, M.IngredientTwo, M.IngredientThree)
);

SELECT * FROM Meals;

ALTER TABLE Orders
ADD COLUMN Cost DECIMAL(5,2);

#adds costs to orders table
UPDATE Orders O
SET Cost = (
    SELECT SUM(M.Cost)
    FROM Meals M
    WHERE M.MealID = O.MealOrdered
);

SELECT * FROM Orders;

#table to track the total cost for each unique order
CREATE TABLE OrderTotals (
    OrderID INT NOT NULL PRIMARY KEY,
    TotalCost DECIMAL(8,2)
);

INSERT INTO OrderTotals (OrderID, TotalCost)
SELECT OrderID, SUM(Cost) AS TotalCost
FROM Orders
GROUP BY OrderID;

ALTER TABLE Orders
ADD CONSTRAINT
FOREIGN KEY (OrderID)
REFERENCES OrderTotals(OrderID);

SELECT * FROM OrderTotals;

DROP PROCEDURE IF EXISTS InsertValue;

DELETE FROM Meals
WHERE MainIngredient = 'Chicken'
  AND IngredientTwo = 'Mushroom'
  AND IngredientThree = 'Lemon';

#procedure to add a new meal to the meals table, callable by providing the three ingredients
#checks if this combination of ingredients is already in the table before inserting
DELIMITER //
CREATE PROCEDURE InsertValue
(
  IN IngOne VARCHAR(50), 
  IN IngTwo VARCHAR(50),
  IN IngThree VARCHAR(50)
)
BEGIN
  DECLARE lastMealID INT;
  IF NOT EXISTS 
	  (
		SELECT 1
		FROM Meals
		WHERE MainIngredient = IngOne
		  AND IngredientTwo = IngTwo
		  AND IngredientThree = IngThree
	  ) 
	  THEN
	  INSERT INTO Meals(MainIngredient, IngredientTwo, IngredientThree, Cost)
	  VALUES (IngOne, IngTwo, IngThree, NULL);
	  SET lastMealID = LAST_INSERT_ID();

	  UPDATE Meals M
	  SET Cost = (
		SELECT SUM(IC.Cost)
		FROM IngredientCosts IC
		WHERE IC.Ingredient IN (M.MainIngredient, M.IngredientTwo, M.IngredientThree)
	  )
	  WHERE M.MealID = lastMealID;
  END IF;
END//

#trigger to update the cost of the new meal before it gets inserted
CREATE TRIGGER BeforeMealInsert
BEFORE INSERT ON Meals
FOR EACH ROW
SET NEW.Cost = (
  SELECT SUM(IC.Cost)
  FROM IngredientCosts IC
  WHERE IC.Ingredient IN (NEW.MainIngredient, NEW.IngredientTwo, NEW.IngredientThree)
);
DELIMITER ;

CALL InsertValue('Chicken', 'Mushroom', 'Lemon');

SELECT * FROM Meals;

#procedure to increase the meal costs by 20% so we actually make profit!
DELIMITER //
CREATE PROCEDURE IncreaseCosts()
BEGIN
  UPDATE Meals
  SET Cost = Cost * 1.2;
END//
DELIMITER ;

Call IncreaseCosts();

SELECT * FROM Meals;

#function to calculate the average cost of meals
DELIMITER //
CREATE FUNCTION CalculateAverageCost()
	RETURNS DECIMAL(10, 2)
	DETERMINISTIC
	BEGIN
		DECLARE AvgCost DECIMAL(10, 2);
		SELECT AVG(Cost) INTO AvgCost
			FROM Meals;
		RETURN AvgCost;
	END //
DELIMITER ;

SELECT CalculateAverageCost() AS AverageMealCost;
