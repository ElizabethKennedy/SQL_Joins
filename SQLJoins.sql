/* joins: select all the computers from the products table:
SELECT * FROM Products WHERE Product IS Computers;
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS Product, categories.Name AS categories
FROM Products
INNER JOIN Categories
ON categories.CategoryID = products.CategoryID
WHERE categories.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name, Products.Price, reviews.Rating
FROM Products
INNER JOIN reviews
ON reviews.ProductID = products.ProductID
Where Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT CONCAT(FirstName, "", LastName) AS Employee, SUM(Quantity) AS Total 
FROM employees
INNER JOIN sales
ON sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID
HAVING Total = (SELECT MAX (Quantity) FROM Sales GROUP BY ProductID)
ORDER BY Total DESC;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS Department, Category.Name AS Category
FROM Departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances";
/* joins: find the product name, total # sold, and total price sold,
SELECT products.Name AS Product 
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name AS Product, SUM(QUANTITY) AS Total_Units_Sold,
SUM(QUANTITY + PricePerUnit) AS Gross_Revenue
FROM sales
INNER JOIN products
ON sales.ProductsID = products.ProductID
WHERE Name LIKE "Eagles: Hotel California";
/*find product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT product.Name AS Product, Reviewer, Rating, Comment
FROM products
INNER JOIN reviews
ON reviews.ProductID = products.ProductID
WHERE Name LIKE "%Visio TV%" AND Rating = (SELECT MIN (Rating) 
FROM reviews WHERE ProductID = product.ProductID);
-- ------------------------------------------ Extra - May be difficult
SELECT 
EMPLOYEES.EMPLOYEEID,
FirstName,
LastName,
products.Name AS Product,
SUM(Quantity) AS Total_Units_Sold,
SUM(Quantity + PricePerUnit) AS Gross_Revenue
FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
INNER JOIN products
ON sales.ProductID = products.ProductID
GROUP BY sales.ProductID
ORDER BY FirstName;
/* Your goal is to write a query that serves as an employee sales report.*/
SELECT 
  ProductID,
  SUM(Quantity) AS Total_Units_Sold,
  SUM(Quantity + PricePerUnit) AS Gross_Revenue
  FROM sales
  INNER JOIN employees
  ON sales.EmployeeID = employees.EmployeeID
  GROUP BY sales.EmployeeID
  ORDER BY ProductID;
  
  SELECT 
    employeee.EmployeeID,
    FirstName,
    LastName,
    products.ProductID,
    product>Name AS Product,
    SUM (Quantity) AS Total_Units_Sold,
    SUM(Quantity +PricePerUnit) AS Gross_Revenue
    FROM sales
    INNER JOIN employees
    ON sales.EmployeeID = employees.EmploiyeeID
    INNER JOIN products
    ON sales.ProductID = products.ProductID
    GROUP BY sales.EmployeeID, slaes.ProductID
    ORDER BY sales.EmployeeID, Gross_Revenue DESC;

/*This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */