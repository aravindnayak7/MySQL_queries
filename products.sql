use northwind;
select *from products;
#finding max price
Select Max(UnitPrice) from Products;

#Select CatId from products where UnitPrice=263.5
Select CatId from products where UnitPrice=(Select Max(UnitPrice) from Products);#example of subquery

select *from Employees;
#Display employees details those have salary more than that of Suyama
select  *from Employees
where EmployeeId=6 and LastName="Suyama";


#
Select Max(Salary) from Employees;
Select CatId from Products where Salary=(Select Max(Salary) from Employees);


#displaying salary more than suyamas
Select *from Employees
where salary>(select salary from employees
where lastName="Suyama");

#in subquery all means max depending on operator used 
Select *from Employees
where salary>All(select salary from employees
where lastName="Suyama");

select lastName from Employees
where salary<All(Select salary from employees
where lastName="Suyama");


select salary from employees;
#min salary
select Min(salary) from employees;
select lastName from employees
where Min(Salary);


#=====joins

select *from Categories, Products;

select C.CategoryId, CategoryName, ProductName
from categories inner join products 
on categories.categoryID = Products.categoryIid;



#product quantity and inventary value
#Inventary value=quanti*price

Select C.CategoryID, CategoryName, Productname, P.UnitPrice, P.UnitPrice * P.UnitsInStock as 'Inventory value'
from categories as C inner join Products as p
on C.CategoryID=p.categoryID;


#Display ordid, OrdDate, Prodname for any one odrid
select *from products;
select o.OrderId, o.OrderDate, p.ProductName
from `order details` as od
inner join Orders as o
on od.OrderId=o.OrderId
inner join Products as p
on od.ProductId=p.ProductId
where od.OrderId='10248';

#add price , qty
#display ord No having max Products ordered #product quantity and inventary value
#Inventary value=quanti*price
select *from `order details`;#quantity ordered,unit price, order id
select *from products;#unit price
select *from Orders;#
select o.orderId, p.productId, od.Quantity, od.UnitPrice,#here quantity and unit price 
	od.UnitPrice*od.Quantity as 'result'
from `order details` as od
Inner join Orders as o
on od.OrderId=o.OrderId
Inner join Products as p
on od.ProductId=p.ProductId
where od.OrderId='10248';



#3.Display ord No having max different products ordered
select *from Products;#Products,productName
select *from `order details`;#quantity ,orderId, ProductId
select *from Orders;
select count(*) from `order details`#count
group by OrderId

select count *max(quantity) from `order details`;



#4.Display ord No having max qty of products ordered
#5.Display the products in each category having price more than average price of the category
select *from Categories;
select *from Products;

select sum(UnitPrice), count(CategoryId) from Products
	products as
where categoryId=1
group by categoryId;

#count (*) group by order Id
#group by 

#cross Join
Select count(*) from categories, products;

#inner join

#left outer join from the left table match 


select *from Categories;
alter table Catergories
add column FashionWear varchar(20);





select c.categoryName, c.categoryId, Productname
from categories as c
left outer join Products as p
on C.CategoryID = p.CategoryID
order by c.categoryID;

desc categories;
insert into Categories value(10,"man","","");


select c.categoryName, c.categoryId, ProductName
from categories as c
right outer join products as p
on c.categoryID = p.CategoryID
order by c.categoryID;


#self Join

select *from employees;
select e2.firstName as 'Employee',
	e1.firstName as 'Reports to'
from employees as E1
Inner join employees as E2
on E1.EmployeeID = E2.reportsto;

select e2.firstName as 'Employee',
	e1.firstName as 'Reports to'
from employees as E1
Right outer join employees as E2#on clause e is on right side 
on E1.EmployeeID = E2.reportsto;


-- Transaction 
use Student;
select *from Categories;
start transaction;
insert into Categories values(104,"Shirt");
insert into Categories values(105,"Shirt");
insert into Categories values(106,"Shirt");
insert into Categories values(10,"Shirt");
insert into Categories values(11,"Shirt");
insert into Categories values(12,"Shirt");
-- rollback;
commit;
