select *from products;
select *from categories;
select *from products where categoryID=1;
select *from products where categoryID=1 or categoryID=2;
select *from products where categoryID=1 and categoryID;
#selection and projection
select productID, productName, UnitPrice 
from products 
where categoryID=1;

Order By UnitPrice desc;
select productID, productName, UnitPrice 
from products 
where ProductName like '%z%'
Order By UnitPrice desc;


select productID, productName, UnitPrice 
from products 
where length(ProductName)=10;
Order By UnitPrice desc;

select ProductID, ProductName, UnitPrice
from products
where length(productName) = 10 or length(productName) = 15
Order By 3 desc;

select productID, productName, UnitPrice 
from products
where UnitPrice>=100 or UniPrice<=200
Order By 3 desc;


select productID, productName, UnitPrice 
from products 
where UnitPrice>=100 or UniPrice<=200
Order By 3 desc;


select productID, productName, UnitPrice 
from products 
where UnitPrice between 100 and 200;
Order By 3 desc;

select *from products;

select *from products
where UnitsInStock =0;



#counting group functions
select count(*) from products;

#sum of unitprice
select sum(UnitPrice) from products;
# max and min
select min(UnitPrice) from products;
select max(UnitPrice) from products;
#avg
select avg(UnitPrice) from products;
# for two decimal places
 select format(avg(UnitPrice),2) from products;
 
 select format(avg(UnitPrie),2) as 'avg UnitPrice' 
 from products;
 
 
 
 select count(ProductID)
 from products
 group by CategoryID;
 
 
 select CategoryID,Count(ProductID)
 from Products group by CategoryID
 order by 2 desc;
 select *from Produtcs;
 
 select CategoryID,count(ProductID), max(UnitPrice)
 from products group by CategoryID
 order by 2 desc;
 
 select CategoryID, Count(ProductID), Max(UnitPrice)
 from products 
 group byTitle
 
 
select *from employees;
 