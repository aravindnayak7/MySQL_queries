-- ==================== Exercise 3 ==================== 
-- Exercise 1
-- ==================== Exercise 1.1 ==================== 
-- Write a query to fetch and display the number of students enrolled for modules on a specific date grouped by start date and display start date and total number of students.
select *from student_status;
desc student_status;
select Start_Date, count(Student_Id) from Student_Status
group by Start_Date;
-- ==================== Exercise 1.2 ==================== 
-- Write a query to fetch and display the number of students enrolled for modules where faculty id is ‘F001’ grouped by start date and display start date and total number of students.
desc Student_status;
select Start_Date,count(*) from Student_Status
where Faculty_ID='F001'
group by Start_Date;
-- ==================== Exercise 1.3 ==================== 
-- Write a query to fetch and display the number of students enrolled for modules where faculty id is ‘F001’ grouped by module start date and display module start date and total number of students where the total number of students > 2.
select *from Student_Details;
select Start_Date,count(*) as count from Student_Status-- start_Date, total num of students>2
where Faculty_ID="F001" 
group by Start_Date
having count>2;
-- ==================== Exercise 1.4 ==================== 
-- Write a query to fetch and display all the modules in ascending order of module duration.
select *from Module_Details
order by Module_Duration asc;
-- ==================== Exercise 1.5 ==================== 
-- Write a query to fetch and display the student’s name, their module enrolled (module name and module id). Order them according to their name.
select *from student_details;-- sname sid
select *from Module_details;-- mname, mid
select *from student_status;-- mid, sid
select sd.student_Name,md.module_id,md.module_name
from Student_Details as sd
Inner Join Student_Status as ss
Inner Join Module_Details as md
on sd.Student_Id = ss.Student_Id and ss.Module_Id = md.Module_Id -- mapping and (ON is for -- relation)
order by sd.Student_Name;
-- ==================== Exercise 2 ==================== 
-- Exercise 2.1
-- ==================== Exercise 2.1 ==================== 
-- Write a query to fetch and display faculty_id and batch_id which will fetch all the combinations of faculty IDs and batch IDs.
select *from Student_Status;
select faculty_Id, Batch_Id from Student_Status;
-- ==================== Exercise 2.2 ==================== 
-- Write a query to fetch and display the records of all the details from Student_Status and batch_info, wherever batch_id is common in both the tables.
select *from Student_Status
Inner Join Batch_Details
on Student_Status.Batch_Id=Batch_Details.Batch_Id;
-- ==================== Exercise 2.3 ==================== 
-- Write a query to fetch and display the student IDs of the students tagged to faculty and all the faculty IDs irrespective of whether there are any students tagged to them or not.
select *from Faculty_Details;
select *from Student_status;
select ss.Student_Id,fd.Faculty_Id 
from Faculty_details as fd
Join Student_Status as ss
ON fd.Faculty_Id=ss.Faculty_Id; 
-- ==================== Exercise 2.4 ====================
-- -- Write a query to fetch and display the student IDs of the students tagged to faculty and all the faculty IDs irrespective of whether there are any students tagged to them or not.
select *from Faculty_Details;
select *from Student_status;
select ss.Student_Id,fd.Faculty_Id 
from Faculty_details as fd
Join Student_Status as ss
ON fd.Faculty_Id=ss.Faculty_Id; 
-- ==================== Exercise 2.5 ====================
-- Write a query to fetch and display the student IDs of all the students and faculty IDs of all faculties irrespective of whetherthese is any association between students and faculty Ids and vice versa.
select * from student_status;
SELECT student_status.student_id, faculty_details.faculty_id
FROM student_status , faculty_details;