USE BestBUy;

/* joins: select all the computers from the products table
using the products table and the categories table, return the product name and the category name */
SELECT products.NAME AS Brand, categories.Name AS Category
FROM products
INNER JOIN categories
ON products.categoryID = categories.CategoryID
WHERE categories.NAME = 'Computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT p.Name, p.Price, r.Rating
FROM products as p
JOIN reviews AS r
ON p.productID = r.ProductID
WHERE r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.employeeID, e.FirstName, e.LastName, sum(quantity) as Quantity
FROm employees as e
INNER JOIN sales as s on e.employeeID = s.employeeID
GROUP BY e.employeeID
ORDER BY quantity DESC; 

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.Name as Department, c.name as Category 
From categories AS c
INNER JOIN departments AS d
ON d.departmentID = c.departmentID
WHERE c.NAME = "appliances" OR c.NAME = "GAMES";

/* joins: find the product name, total # sold, and total price sold,
for Eagles: Hotel California --You may need to use SUM() */
SELECT products.NAME AS Products, SUM(quantity) AS `Total Units Sold`,
SUM(quantity * PricePerUnit) AS `Gross Revenue`
FROM sales
INNER JOIN products
ON sales.productID = products.ProductID
WHERE products.NAME LIKE "%%Hotel%California%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT p.NAME, r.reviewer, r.rating, r.comment
FROM products as p
JOIN reviews as r
ON r.ProductID = p.ProductID
Where r.rating = 1 and p.name like "%visio%TV"; 
