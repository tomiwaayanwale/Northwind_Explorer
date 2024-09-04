-- 1.	What is the name of the company with customer ID 1? 
select CompanyName
from customers
where CustomerID = 1;
-- 2.	What is the name of the employee who made the sale with OrderID 10248? 
select concat_ws(' ',firstname,lastname) as emp_name
from orders o 
join employees e on o.EmployeeID = e.EmployeeID
where orderid = 10248;
-- 3.	How many products does the category with CategoryID 1 have? 
select count(productid) as products
from products
where CategoryID = 1;
-- 4.	What is the total price of the products ordered in OrderID 10248? 
select sum(unitprice)
from `order details`
where OrderID = 10248;
-- 5.	What is the name of the customer with CustomerID ALFKI? 
select contactname 
from customers
where CustomerID = 'ALFKI';
-- 6.	What is the total number of orders placed by the customer with CustomerID ALFKI? 
select count(orderid) 
from orders
where CustomerID = 'ALFKI';
-- 7.	What is the name of the supplier that supplied the product with ProductID 1? 
select supplierid
from products
where productid = 1;
-- 8.	What is the name of the employee with EmployeeID 5? 
select concat_ws(' ',firstname,lastname) as Name
from employees
where employeeid = 5;
-- 9.	What is the total number of customers in the Customers table? 
select count(customerid) as customer
from customers;
-- 10.	What is the total number of employees in the Employees table? 
select count(employeeid) as employees
from employees;
-- 11.	What is the total number of orders in the Orders table?
select count(orderid) as orders
from `order details`;
-- 12.	What is the total number of products in the Products table? 
select count(productid) as products
from products;
-- 13.	What is the total number of categories in the Categories table? 
select count(categoryid) as category
from categories;
-- 14.	What is the total number of suppliers in the Suppliers table? 
select count(supplierid) as suppliers
from suppliers;
-- 15.	What is the total number of shippers in the Shippers table? 
select count(shipperid) as shippers
from shippers;
-- 16.	What is the total number of territories in the Territories table? 
select count(territoryid) as territory
from territories;
-- 17.	What is the total number of regions in the Regions table? 
select count(regionid) as regions
from region;
-- 18.	How are you feeling so far?? Do you still want to do this data thing?? 
/* its interesting  */
-- 19.	What is the name of the shipper with ShipperID 2? 
select shipperid
from shippers
where shipperid = 2;
-- 20.	What is the phone number of the customer with CustomerID ANATR? 
select phone 
from  customers
where customerid = 'ANATR';
-- 21.	What is the city of the customer with CustomerID ANATR? 
select city 
from customers
where customerid = 'ANATR';
-- 22.	What is the postal code of the customer with CustomerID ANATR? 
select postalcode
from customers
where customerid = 'ANATR';
-- 23.	What is the name of the contact person for the customer with CustomerID ANATR? 
select contactname
from  customers
where customerid = 'ANATR';
-- 24.	What is the name of the product with ProductID 1? 
select productname	
from  products
where productid = 1;
-- 25.	What is the unit price of the product with ProductID 1? 
select unitprice
from products
where productid = 1;
-- 26.	What is the quantity of the product with ProductID 1 in stock? 
select quantityperunit 
from products
where productid = 1;
-- 27.	What is the name of the category with CategoryID 1? 
select categoryname 
from categories
where categoryid = 1;
-- 28.	What is the name of the supplier with SupplierID 1? 
select supplierid
from suppliers
where supplierid = 1;
-- 29.	What is the name of the shipper with ShipperID 1? 
select shipperid
from shippers
where shipperid = 1;
-- 30.	What is the name of the region with RegionID 1? 
select regionid
from region
where regionid = 1;
-- 31.	What is the name of the territory with TerritoryID 1?
select territorydescription
from territories
where territoryid = 1; 
-- 32.	What is the total no of orders sold by the company in the year 1997?
select count(orderid) as ordered
from orders 
where (orderdate between '1997-01-01'  and  '1997-12-31');
-- 33.	What are the names of all the products that have been discontinued? 
select productname
from products
where discontinued = True;
-- 34.	What is the total quantity of each  product that has been ordered? 
select productname,sum(quantityperunit) as qauntity
from products
group by productname
order by 2 ;
-- 35.	Which customer has placed the most number of orders? 
select customerid,count(orderid) as orders
from orders
group by customerid
order by 2 desc;
-- 36.	What is the total amount spent by each customer in the year 1998? 
select customerid, sum(freight) as price
from orders
where (orderdate between '1998-01-01' and '1998-12-31')
group by customerid
order by price desc;
-- 37.	What are the IDs of all the employees who have sold products to customers in France?
select distinct employeeid
from orders
where shipcountry = 'france';
-- 38.	What is the average freight it cost to ship to each city in the USA in 1996? 
select avg(freight) as average,shipcity
from orders
where  shipcountry = 'USA' and (shippeddate between '1996-01-01' and '1996-12-31')
group by 2
order by 1;
-- 39.	What are the names of all the customers from the USA? 
select customerid
from customers
where country = 'USA';
-- 40.	What is the total number of orders that has been ordered by customers in Germany? 
select count(orderid)
from orders 
where shipcountry = 'germany';
-- 41.	You would agree with me that all these is not as difficult as people make it seem right? 
/*
yes oo*/
-- 42.	What is the average price of all the products in the database? 
select avg(unitprice) as average,productname
from products
group by 2
order by 1;
-- 43.	What are the names of all the employees who have sold products to customers in Germany? 
with cte_1 as
(select concat_ws(' ',e.firstname,e.lastname) as fullname
from orders o 
join employees e on e.employeeid = o.employeeid
where shipcountry = 'Germany')
select distinct fullname
from cte_1;
-- 44.	What is the total number of orders that has been ordered by customers in the year 1998? 
select customerid,count(orderid) as orders
from orders
group by 1
order by 2 desc;
-- 45.	What is the total revenue earned by each products that costs 20 dollars but more than 4 dollars? 
select p.productname,(od.quantity*od.unitprice) as total_revenue
from `order details` od
join products p on od.productid = p.productid
where od.unitprice < 20;
-- 46.	What is the min quantity of each product that has been ordered  
select min(quantity) as min,productname
from `order details`,products
group by 2
order by 1;
-- 47.	What is the average quantity of each product that has been ordered? 
select avg(quantity) as avg, productname
from `order details`, products
group by 2
order by 1 desc;
-- 48.	What are the ID of all the customers who have placed orders in the year 1997? 
select distinct customerid
from orders
where (orderdate between '1997-01-01' and '1997-12-31');
-- 49.	What is the total freight that was paid by customers in the USA? 
select sum(freight) 
from orders
where shipcountry = 'USA';
-- 50.	What are the IDs of the top 20 best performing employees who have sold products to customers in the year 1997? 
with cte_1 as(
select e.employeeid,o.customerid,max(o.freight),o.orderdate
from orders o
join employees e on e.employeeid = o.employeeid
where (orderdate between '1997-01-01' and '1997-12-31')
group by 1,4,2
order by 3 desc
)
select distinct employeeid
from cte_1;
-- 51.	What is the total revenue earned by each employee on the first day of every month in the first quarter of  1997? 
select sum(od.quantity*od.unitprice) as `Total Revenue` ,e.firstname,e.lastname,
date_format(o.orderdate, '%Y-%m-%d') as ordermonth
from employees e 
join orders o on e.employeeid = o.employeeid
join `order details` od on o.orderid = od.orderid
where o.orderdate>='1997-01-01' and o.orderdate < '1997-04-01' and day(o.orderdate) = 1
group by 2,3,4
order by 3,4;
-- What are the names of all the products that are out of stock?
select productname
from products
where  unitsinstock=false;
-- 53. What is the total freight revenue earned by the company in the year 1998 in each country?
select sum(freight),year(orderdate),shipcountry
from orders
where year(orderdate) = '1998'
group by 2,3
order by 1 desc;
-- 54. What is the average quantity of each product that has been sold more than 10 times
with cte_1 as (
select avg(od.quantity) as avg,p.productname,count(od.orderid) as no_of_times
from `order details` od
join orders o on od.orderid = o.orderid
join products p on od.productid=p.productid
group by 2
having no_of_times > 10
order by 3 desc)
select avg,productname
from cte_1
; 
-- 55. What is the total amount spent on freight by each French customer in the year 1997?
select sum(o.freight) as `Total freight`,year(o.orderdate) as year,o.customerid
from orders o
join customers c on c.customerid = o.customerid 
where year(orderdate) = '1997' and country = 'France'
group by 2,3
order by 1 desc; 
-- 56. Write a query to get Product name and quantity/unit.
select productname,quantityperunit
from products;
-- 57. Write a query to get current Product list (Product ID and name).
select productid,productname
from products
order by 1;
-- 58. Write a query to get discontinued Product list (Product ID and name).
select productid,productname
from products
where discontinued = True;
-- 59. Write a query to get most expense and least expensive Product list (name and unit price).
select productname,unitprice
from products
where unitprice = (
                  select max(unitprice)
                   from products)
union all
select productname,unitprice
from products
where unitprice = (
                  select min(unitprice)
                  from products)
;
-- 60. Write a query to get Product list (id, name, unit price) where current products cost less than $20
select productid,productname,unitprice
from products
where unitprice < 20;
/*61. 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and
$25.*/
select productid,productname,unitprice
from products
where unitprice >= 15 and unitprice <= 25;
/* 62. If you have made it this far you really need to tell me what kept you going because it can’t be for
10 marks.*/
/* because its interesting*/
-- 63. 7. Write a query to get Product list (name, unit price) of above average price.
select productid,productname,unitprice
from products
where unitprice > (
                    select avg(unitprice)
                    from products
                    );
-- 64. 8. Write a query to get Product list (name, unit price) of ten most expensive products
select productid,productname,unitprice
from products
order by unitprice desc
limit 10;
-- 65 9. Write a query to count current and discontinued products.
select count(productid) as products
from products;
-- 66. What is the name of the territory with TerritoryID 4?
select territorydescription
from territories
where territoryid = 4;
-- 67. What is the total no of orders sold by the company in the year 1998?
select count(od.orderid) as orders
from `order details` od,orders o
where year(orderdate) = 1998
;
-- 68. What are the names of all the products that have not been discontinued?
select productname
from products
where discontinued = false;
/*69. What is the total quantity and renenue of each product that has been ordered for products that
cost less than 10 dollar?*/
select distinct p.productname, (od.quantity * od.unitprice) as `Total revenue`
from `order details` od,products p
where od.unitprice < 10
group by 1,2;
-- 70. Which top 5 customer has placed the most number of orders?
select o.customerid,count(od.orderid) as total
from `order details` od
join orders o on o.orderid=od.orderid
group by 1
order by 2 desc
limit 5;
/*71. What is the total amount spent by each customer in the year 1997 on orders sold by employee
3?*/
select sum(freight) as freight,customerid
from orders 
where year(orderdate) = 1997 and employeeid = 3
group by 2
order by 1 desc;
-- 72. What are the IDs of all the employees who have sold products to customers in France?
select employeeid from employees
where employeeid in (select distinct employeeid
from orders
where shipcountry = 'France'
order by employeeid );
/*73. What is the average freight it cost to ship to each city in the Canada in the –ember months of
1997?*/
with cte_1 as (
select avg(o.freight)as freight,o.shipcountry,date_format(o.orderdate,'%M') as `month`,year(o.orderdate) as year,c.city
from orders o 
join customers c on c.customerid=o.customerid
where month(o.orderdate) >= 9 and year(o.orderdate) = '1997' and o.shipcountry='canada'
group by 2,3,4,5
)
select *
from cte_1;
-- 74. What is the max quantity of each product that has been ordered
select p.productname, max(od.quantity) as maximum
from products p
join `order details` od on od.productid = p.productid
group by productname
order by maximum desc;
-- 75. What is the average revenue of each product that has been ordered less than 10 times?
with cte_1 as(
select p.productname,avg(od.unitprice * od.quantity) as revenue,count(od.orderid) as no_of_times
from `order details` od 
join products p on p.productid = od.productid
group by productname
order by no_of_times desc
)
select productname,revenue,no_of_times
from cte_1
where no_of_times < 10;
-- 76. What are the ID of all the customers who have placed orders in the first quarter of year 1997?
select customerid,year(orderdate) as year,date_format(orderdate, '%M') as month
from orders
where year(orderdate) = 1997 and month(orderdate) < 4;
-- 77. What is the total freight that was paid by customers in the USA to employee 4?
select (freight) as total_freight
from orders
where shipcountry= 'USA' and employeeid = 4;
/* 78. What are the IDs of the top 6 best performing employees who have sold products to customers
in the year 1997?*/
with cte_1 as(
select o.employeeid,count(od.orderid) as `most orders`,year(o.orderdate) as year
from orders o
join `order details` od on od.orderid = o.orderid
where year(o.orderdate) = 1997
group by employeeid,year
order by `most orders` desc
limit 6
)
select employeeid,`most orders`
from cte_1;
-- 79. What is the total number of late orders attributed to each employee in 1997
with cte_1 as(
select concat_ws(' ',e.firstname,e.lastname) as fullname,year(o.orderdate) as year,datediff(o.requireddate,o.shippeddate) as late_orders
from orders o
join employees e on  e.employeeid = o.employeeid
where datediff(o.requireddate,o.shippeddate) < 0 and year(o.orderdate)= 1997
order by late_orders
)
select fullname,count(fullname) as no_of_times
from cte_1
group by fullname
order by no_of_times desc;
-- 80. return  the names of all the companies that has never bought
-- anything from us
select c.companyname
from orders o
right join customers c on c.customerid = o.customerid
where orderid is  null;

-- 81 return the names of employees and the name of their manager

select e.firstname as staff, m.firstname 
from employees  e 
left join employees m on m.employeeid = e.reportsto;

-- 82.write a query that returns the details of employees
-- that earns more than there manager and by percentage.
select e.firstname as staff, e.salary as salary,
m.firstname as manager, m.salary,
(e.salary - m.salary)/m.salary * 100 as percentage_difference
from employees e
join employees m on m.employeeid= e.reportsto
where e.salary > m.salary;
 -- 83. write a query that returns the names of the names of employees 
 -- that earn above average salary
 select firstname, lastname, salary
 from employees
 where salary > (select avg(salary)from employees);
 -- 84. return top 10 best performing cities in terms of number of order and the percentage contribution
 -- of that city.
 select shipcity, count(orderid) as no_of_orders,
  (count(orderid)/(
  select count(orderid)
  from orders))* 100 as percentage_contribution
  from orders
  group by shipcity
  order by no_of_orders desc
  limit 10;
  -- 85. return the name of employees and the number of times
  -- they are responsible for sending a late order.
  select firstname, lastname, count(firstname) as no_of_times
  from(
	   select e.firstname,e.lastname,
        o.requireddate, o.shippeddate
        from orders o
        join employees e on e.employeeid= o.employeeid
        where o.shippeddate > o.requireddate)  as temporary_table
        group by firstname, lastname
        order by no_of_times desc;
-- 86. return the number of time an employee that earn more manager as send a late order
-- also return the name of those employee.
with cte_1 as (
select concat_ws(' ',e.firstname,e.lastname)as staff, e.salary as salary,
m.firstname as manager,
m.salary as manager_salary,o.requireddate, o.shippeddate
from orders o
join employees e on e.employeeid= o.employeeid
join employees m on m.employeeid= e.reportsto
where o.shippeddate > o.requireddate and e.salary > m.salary
group by staff,salary,manager,manager_salary,o.requireddate, o.shippeddate
)
select staff,count(staff) as no_of_times
from cte_1
group by staff
order by no_of_times desc;
use northwind;
-- 87. Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName. 
select categoryname,description
from categories
order by categoryname;
-- 88.Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone. 
select contactname,companyname,contactTitle,phone
from customers
order by phone;
/* 89. Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname 
respectively and HireDate from the employees table sorted from the newest to the oldest employee. */ 
select ucase(firstname),upper(lastname),hiredate
from employees
order by hiredate desc;
/*
90. Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted 
by Freight in descending order. 

*/
select orderid,orderdate,shippeddate,customerid,freight
from orders
order by freight desc
limit 10;
/*
91. Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the 
Country in descending order then by CompanyName in ascending order. 
*/
select companyname,fax,phone,country,homepage
from suppliers
order by country desc,companyname;  
/*
92. Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only. 
*/
select companyname,contactname
from customers
where city ='Buenos Aires';
/*
93. Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock. 
*/
select productname,unitprice,quantityperunit
from products
where  unitsinstock=false;
-- 94.  Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain. 
select contactname,address,city
from customers
where country != 'mexico' and country != 'spain' and  country != 'germany';
-- 95. Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996. 
select o.orderdate,o.shippeddate,o.customerid,o.freight
from `order details`
join orders o
using(orderid)
where orderdate='1996-8-20';
/*
96. Create a select statement that outputs the following: 

*/
select concat(firstname,' ',lastname,' ','can',' ','be',' ','reached',' ',' ','at',' ','x',extension) as contactinfo
from employees;
/*
97.	Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname. 

*/
select contactname
from customers
where substr(contactname,2,1) not in ('a');
/*

98.	Create a report that shows the average UnitPrice rounded to the next whole number, 
total price of UnitsInStock and maximum number of orders from the products table. 
All saved as AveragePrice, TotalStock and MaxOrder respectively. 

*/
with cte_1 as(
select avg(p.unitprice) as Averageprice, sum(p.unitprice*unitsinstock)as TotalStock,
max(orderid) as MaxOrder
from products p
inner join `order details` o on o.productid = p.productid
order by Averageprice,TotalStock,MaxOrder
)
select round(Averageprice,0) as AveragePrice,Totalstock,MaxOrder
from cte_1;
/*
99.	Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products,
 suppliers and categories table. 

*/
select s.supplierid,companyname,categoryname,productname,unitprice
from suppliers s,categories,products;

/*

100.	Create a report that shows the OrderID ContactName, UnitPrice,
 Quantity, Discount from the order details, 
orders and customers table with discount given on every purchase. 

*/
select od.orderid,c.contactname,od.unitprice,od.discount
from `order details` od,orders o,customers c
order by 4 desc;








