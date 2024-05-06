# 1 Total Product Lines

select count(*) as Total_Product_line from productlines;

# 2 Total Products

select count(*) as Total_Products from products;

# 3 Total products ordered

select sum(quantityOrdered) as Total_ordered_products from orderdetails;

# 4 Total Sales

select sum(Sales) as Total_sales from orderdetails;

# 5 Actual Buy price

select sum(quantityOrdered * buyprice) as Actual_buy_Price
from orderdetails OD
join products P 
on OD.productCode = P.productCode;

# 6 Total Profit

select
( select sum(Sales) from orderdetails) -
(select sum(quantityOrdered * buyprice) as Actual_buy_Price
from orderdetails OD
join products P 
on OD.productCode = P.productCode) as Profit;

# 7 Total Customers

select count(*) as Total_customers from customers;

# 8 Total Employees

select count(*) as Total_Employees from employees;

# 9 Product Line with high Sales

select P.productLine,sum(Sales) from products P
join orderdetails OD
on OD.productCode = P.productCode
Group by P.productLine
order by sum(Sales) desc;

# 10 Top 5 countries by Sales

select country,sum(sales) as Total_sales from customers C
join orders O 
on O.customerNumber = C.customerNumber
join orderdetails OD
on OD.orderNumber = O.orderNumber
group by country
order by sum(Sales) desc limit 5;

# 11 Month with the highest Sales

select Month(orderDate) as month, sum(sales) as Total_sales from orders O
join orderdetails OD
on OD.orderNumber = O.orderNumber
group by month(orderDate)
order by sum(Sales) desc;

# 12 Top 3 Profitable products

select productName, sum(sales) as Total_sales from products P
join orderdetails OD
on OD.productCode = P.productCode
group by productName
order by sum(Sales) desc;

# 13 Top 3 ordered products

select productName, sum(quantityOrdered) as Total_sales from products P
join orderdetails OD
on OD.productCode = P.productCode
group by productName
order by sum(quantityOrdered) desc;

# 14 Top 5 customers with highest Sales

select customerName,sum(sales) as Total_sales from customers C
join orders O 
on O.customerNumber = C.customerNumber
join orderdetails OD
on OD.orderNumber = O.orderNumber
group by customerName
order by sum(Sales) desc limit 5;