/*Exercise 1:-
After completing this MR exercises you will be able to implement Operators inside SQL queries.

Problem Statement:*/
-- ==================== Exercise 1.1 ====================
-- Write a query to fetches and displays all the faculties details who don’t have an email id.
select *from faculty_details
where Faculty_Email
NOT IN(
select Faculty_Email from Faculty_Details);
-- ==================== Exercise 1.2 ====================
-- Write a query to display the id, name, track and location of all Faculties who’s Experience are greater than 4 years.
-- faculty_id, faculty_Name, Faculty_Track, Faculty_Location
select faculty_id, faculty_Name, Faculty_Track, Faculty_Location from Faculty_Details
where Faculty_Experiance>4; 
-- ==================== Exercise 1.3 ====================
-- Select all the modules whose duration > 150.
select *from module_details
where Module_Duration>150;
-- ==================== Exercise 1.4 ====================
-- Select all the Faculty Id, Faculty name whose qualification is not ‘Bachelor of Technology’.
select Faculty_Id, Faculty_Name from Faculty_Details
where Faculty_Qualification NOT IN ("Bachelor of Technology");
-- ==================== Exercise 1.5 ====================
-- Select all the modules whose duration is between 100 and 200.
select *from Module_Details
where Module_Duration between 100 and 200;
-- ==================== Exercise 1.6 ====================
-- Display the Faculty Id, Faculty name with first name starting with ‘A’
select Faculty_Id, Faculty_Name from Faculty_Details
where Faculty_Name LIKE "A%";
-- ==================== Exercise 1.7 ====================
-- Display the Faculty Id, Faculty name whose first name contains a character ‘M’
select Faculty_Id, Faculty_Name from Faculty_Details
where Faculty_Name LIKE "M%";
-- ==================== Exercise 1.8 ====================
-- Display the names of all the modules where the module name does not exists.
select *from module_details;

select *from Module_Details;
-- ==================== Exercise 2.0 ====================
-- After completing this MR exercises you will be able to implement Functions inside SQL queries.
-- ==================== Exercise 2.1 ====================
-- Write a query to display the module name and module duration of the entire modules.
select Module_Name, Module_Duration from Module_Details;
-- ==================== Exercise 2.2 ==================== 
-- Write a query to display list of all the module id and module names with first letter capital of module name from ModuleDetails table.
select Module_Id, LEFT(Module_Name,1) from Module_Details;
-- ==================== Exercise 2.3 ==================== 
-- Write a query to display the module id and the number of days between the current date and module start date from Student_Status table.
select Current_Date();
select datediff(current_Date(),Start_Date) from Student_Status;
select current_date();
-- ==================== Exercise 2.4 ==================== 
-- Write a query to concatenate the Module Name and Module id in the below mentioned format and display all the modules from the moduleDetails table. “Module Id is Module_Id and Module Name is Module Name”
select *from Module_Details;
select CONCAT(Module_Id,Module_Name) from Module_Details;
-- ==================== Exercise 2.5 ==================== 
-- Write a query to display all the Module Name in upper case
select UPPER(Module_Name) from Module_Details;
-- ==================== Exercise 2.6 ==================== 
-- Write a query to display all the characters between 2 to 4 of the Module name column for all the modules in the ModuleDetails table.
select *from Module_Details;
select  Substring(Module_Name,2,4) from Module_Details;
-- ==================== Exercise 2.7 ==================== 
-- Write a query which will return the total count of all the students.
select count(Student_Id) from Student_Details;
-- ==================== Exercise 2.8 ==================== 
-- Write a query to display the total faculty members not having their email ID.
select *from Faculty_Details;
select *from Faculty_Details
where Faculty_Email NOT IN (Faculty_Email);