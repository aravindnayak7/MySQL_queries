select *from employees;
#1. counting mr., Dr and ms.

select TitleOfCourtesy, count(TitleOfCourtesy)
from employees;

select count(*) TitleOfcourtesy;

select TitleOfCourtesy, count(TitleOfCourtesy)
from employees
group by TitleOfCourtesy;

select TitleOfCourtesy, count(TitleOfCourtesy)
from employees
where TitleOfCourtesy='Mr'
group by TitleOfCourtesy;


