/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name FROM products LEFT JOIN categories ON Products.CategoryID = categories.CategoryID WHERE categories.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name, products.Price, reviews.Rating FROM reviews LEFT JOIN Products ON reviews.ProductID = products.ProductID WHERE reviews.Rating = 5;
 
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(sales.Quantity), employees.FirstName, employees.LastName FROM sales 
INNER JOIN employees ON sales.EmployeeID = employees.EmployeeID 
GROUP BY employees.EmployeeID ORDER BY Sum(sales.Quantity) desc
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- Thought processes
	-- What columns do you need? department.name and categories.name
    -- What kind of join do you need? Inner join probably, to make sure each department row has a corresponding appliances row and vice versa
    -- Where do categories and departments overlap? Department ID
SELECT departments.Name, categories.Name FROM departments INNER JOIN categories ON departments.DepartmentID = categories.DepartmentID 
WHERE categories.Name = "Appliances" OR categories.Name = "Games"; 


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity), SUM(sales.Quantity * sales.PricePerUnit) as "Total Price" FROM products 
INNER JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name = "Eagles: Hotel California";


/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment FROM products 
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name = "Visio TV" ORDER BY reviews.Rating ASC limit 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity) FROM employees 
	INNER JOIN sales on employees.EmployeeID = sales.EmployeeID 
	INNER JOIN products on sales.ProductID = products.ProductID
    GROUP BY sales.EmployeeID, products.ProductID
    ORDER BY SUM(sales.Quantity) DESC;

