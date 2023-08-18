Create Database Exercise2;
/*============================ Excersice 1 =========================
Exercise-1
Let’s now focus on the online feedback system for NIIT. As per the design participants have to develop the required table structure by using ANSI SQL Syntax.

After completing the hands-on exercises, you will be able to: Understand How to Create Tables.*/
create Database Exercise2;
use Exercise2;
-- FacultyDetails
-- drop Database NIIT;
create table Faculty_Details(
	Faculty_Id varchar(20) primary key,
    Faculty_title varchar(7),
    Faculty_Name varchar(30),
    Faculty_Location varchar(30),
    Faculty_Track varchar(15),
    Faculty_Qualification varchar(100),
    Faculty_Experiance numeric(11),
    Faculty_Email varchar(100),
    Faculty_Password varchar(20)
);
-- ============================ Batch Details ============================
create table Batch_Details(
	Batch_Id varchar(20) primary key,
    Batch_Faculty varchar(30),
    Batch_DEPT_Name varchar(30)
);
-- ============================ Module Details ============================
create table Module_Details(
	Module_Id varchar(20) primary key,
    Module_Name varchar(40),
    Module_Duration numeric(11)
);

-- ============================ Student Deatails ============================
create table Student_Details(
	Student_Id varchar(20) primary key,
    Title varchar(7),
    Student_Name varchar(30),
    Student_Location varchar(30),
    Student_Track varchar(15),
    Student_Qualification varchar(200),
    Student_Email varchar(100),
    Student_Password varchar(20)
);
-- ============================ Questions ============================
create table Questions(
	Question_Id varchar(20) Primary key,
    Module_Id varchar(20),
	FOREIGN KEY(Module_Id) REFERENCES Module_Details(Module_Id),
    Question_Text varchar(900)
   
);
-- ============================ Student_Status ============================
create table Student_Status(
	Student_Id varchar(20),
    FOREIGN KEY (Student_Id) REFERENCES Student_Details(Student_Id),
    Module_Id varchar(20),
    FOREIGN KEY (Module_Id) REFERENCES Module_Details(Module_Id),
    Start_Date varchar(20),
    End_Date varchar(20),
    AFeedbackGiven varchar(20),
    TFeedbackGiven varchar(20)
);
-- ============================ Faculty_Feedback ============================
create table Faculty_Feedback(
	Faculty_Id varchar(20),
    FOREIGN KEY (Faculty_Id) REFERENCES Faculty_Details(Faculty_Id),
    Question_Id varchar(20),
    FOREIGN KEY (Question_Id) REFERENCES Questions(Question_Id),
    Batch_Id varchar(20),
    FOREIGN KEY (Batch_Id) REFERENCES Batch_Details(Batch_Id),
    Module_Id varchar(20),
    FOREIGN KEY (Module_Id) REFERENCES Module_Details(Module_Id),
    Faculty_Rating numeric(11)
);
-- ============================ Student_Feedback ============================
create table Student_Feedback(
	Student_Id varchar(20),
    Foreign key(Student_Id) References Student_Details(Student_Id),
    Question_Id varchar(20),
    Foreign key(Question_Id) References Questions(Question_Id),
    Module_Id varchar(20),
    Foreign key(Module_Id) References Module_Details(Module_Id),
    Student_Rating numeric(11)
);
-- ============================ Login-Details ============================
create table Login_Details(
	User_Id varchar(20),
    User_Password varchar(20)
);
select *from batch_details;
select *from Faculty_Details;
select *from Batch_Details;
select *from Module_Details;
select *from Student_Details;
select *from Questions;
select *from Student_Status;
desc Student_Status;
select *from Student_Feedback;
select *from Login_Details;



-- ============================ Exercise-2 ============================
--      Modify the table Student_Status to include following two columns:
Alter Table Student_Status
Add Batch_Id varchar(20),
Add FOREIGN KEY (Batch_Id) REFERENCES Batch_Details(Batch_Id);

Alter Table Student_Status
Add Faculty_Id varchar(20),
Add FOREIGN KEY (Faculty_Id) REFERENCES Faculty_Details(Faculty_Id);
desc Student_Status;
-- add constraint Primary key(Batch_Id,Faculty_Id,Student_Id,Module_Id);
-- ----------------Start_Date
--     Modify two columns data types of the table Student_Status as follows:
alter table Student_Status
Modify Column Start_Date date,
Modify Column End_Date date;


-- ============================ Exercise 3 ============================
-- FacultyDetails
insert into Faculty_Details values ("F001","Mr.","PANKAJ GHOSH","Pune","Java","Bachelor of Technology",12,"Pankaj.Ghosh@alliance.com","fac1@123");
insert into Faculty_Details values ("F002","Mr.","SANJAY RADHAKRISHNAN" ,"Bangalore","DotNet","Bachelor of Technology",12,"Sanjay.Radhakrishnan@alliance.com","fac2@123");
insert into Faculty_Details values ("F003","Mr.","VIJAY MATHUR","Chennai","Mainframe","Bachelor of Technology",10,"Vijay.Mathur@alliance.com","fac3@123");
insert into Faculty_Details values ("F004","Mrs.","NANDINI NAIR","Kolkata","Java","Master of Computer Applications",9,"Nandini.Nair@alliance.com","fac4@123");
insert into Faculty_Details values ("F005","Mis.","ANITHA PAREKH","Hyderabad","Testing","Master of Computer Applications",6,"Anitha.Parekh@alliance.com","fac5@123");
insert into Faculty_Details values ("F006","Mr.","MANOJ AGRAWAL ","Mumbai","Mainframe","Bachelor of Technology",9,"Manoj.Agrawal@alliance.com","fac6@123");
insert into Faculty_Details values ("F007","Ms.","MEENA KULKARNI","Coimbatore","Testing","Bachelor of Technology",5,"Meena.Kulkarni@alliance.com","fac7@123");
insert into Faculty_Details values ("F009","Mr.","SAGAR MENON ","Mumbai","Java","Master of Science In Information Technology",12,"Sagar.Menon@alliance.com","fac8@123");

Select *from Faculty_Details;

-- ============================ Batch Details ============================
desc batch_details;
insert into Batch_Details values("B001","MRS.SWATI ROY","MSP");
insert into Batch_Details values("B002","MRS.ARURNA K","HEALTHCARE");
insert into Batch_Details values("B003","MR.RAJESH KRISHNAN","LIFE SCIENCES");
insert into Batch_Details values("B004","MR.SACHIN SHETTY","BFS");
insert into Batch_Details values("B005","MR.RAMESH PATEL","COMMUNICATIONS");
insert into Batch_Details values("B006","MRS.SUSAN CHERIAN","RETAIL & HOSPITALITY");
insert into Batch_Details values("B007","MRS.SAMPADA JAIN","MSP");
insert into Batch_Details values("B008","MRS.KAVITA REGE","BPO");
insert into Batch_Details values("B009","MR.RAVI SEJPAL","MSP");

Select *from Batch_Details;

-- ============================ Module Details ============================

insert into Module_Details values("O10SQL","Oracle 10g SQL",16);
insert into Module_Details values("O10PLSQL","Oracle 10g PL/ SQL ",16);
insert into Module_Details values("J2SE","Core Java SE 1.6",288);
insert into Module_Details values("J2EE","Advanced Java EE 1.6",80);
insert into Module_Details values("JAVAFX","JavaFX 2.1",80);
insert into Module_Details values("DOTNT4",".Net Framework 4.0 ",50);
insert into Module_Details values("SQL2008","MS SQl Server 2008",120);
insert into Module_Details values("MSBI08","MS BI Studio 2008",158);
insert into Module_Details values("SHRPNT","MS Share Point ",80);
insert into Module_Details values("ANDRD4","Android 4.0",200);
insert into Module_Details values("EM001","Instructor",0);
insert into Module_Details values("EM002","Course Material",0);
insert into Module_Details values("EM003","Learning Effectiveness",0);
insert into Module_Details values("EM004","Environment",0);
insert into Module_Details values("EM005","Job Impact",0);
insert into Module_Details values("TM001","Attendees",0);
insert into Module_Details values("TM002","Course Material",0);
insert into Module_Details values("TM003","Environment",0);

select *from Module_Details;

-- ============================ Student Details ============================

insert into Student_Details values("A001","Miss.","GAYATHRI NARAYANAN","Gurgaon","Java","Bachelor of Technology","Gayathri.Narayanan@hp.com","tne1@123");
insert into Student_Details values("A002","Mrs.","RADHIKA MOHAN","Kerala","Java","Bachelor of Engineering In Information Technology","Radhika.Mohan@cognizant.com","tne2@123");
insert into Student_Details values("A003","Mr.","KISHORE SRINIVAS","Chennai","Java","Bachelor of Engineering In Computers","Kishore.Srinivas@ibm.com","tne3@123");
insert into Student_Details values("A004","Mr.","ANAND RANGANATHAN","Mumbai","DotNet","Master of Computer Applications","Anand.Ranganathan@finolex.com","tne4@123");
insert into Student_Details values("A005","Miss.","LEELA MENON","Kerala","Mainframe","Bachelor of Engineering In Information Technology","Leela.Menon@microsoft.com","tne5@123");
insert into Student_Details values("A006","Mrs.","ARTI KRISHNAN","Pune","Testing","Master of Computer Applications","Arti.Krishnan@cognizant.com","tne6@123");
insert into Student_Details values("A007","Mr.","PRABHAKAR SHUNMUGHAM","Mumbai","Java","Bachelor of Technology","Prabhakar.Shunmugham@honda.com","tne7@123");

select *from Student_Details;

-- ============================ Questions ============================

insert into Questions values("Q001","EM001","Instructor knowledgeable and able to handle all your queries");
insert into Questions values("Q002","EM001","All the topics in a particular course handled by the trainer without any gaps or slippages");
insert into Questions values("Q003","EM002","The course materials presentation, handson, etc. refered during the training are relevant and useful.");
insert into Questions values("Q004","EM002","The Hands on session adequate enough to grasp the understanding of the topic.");
insert into Questions values("Q005","EM002","The reference materials suggested for each module are adequate.");
insert into Questions values("Q006","EM003","Knowledge and skills presented in this training are applicatible at your work");
insert into Questions values("Q007","EM003","This training increases my proficiency level");
insert into Questions values("Q008","EM004","The physical environment e.g. classroom space, air-conditioning was conducive to learning.");
insert into Questions values("Q009","EM004","The software/hardware environment provided was sufficient for the purpose of the training.");
insert into Questions values("Q010","EM005","This training will improve your job performance.");
insert into Questions values("Q011","EM005","This training align with the business priorities and goals.");
insert into Questions values("Q012","TM001","Participants were receptive and had attitude towards learning.");
insert into Questions values("Q013","TM001","All participats gained the knowledge and the practical skills after this training.");
insert into Questions values("Q014","TM002","The course materials presentation, handson, etc. available for the session covers the entire objectives of the course.");
insert into Questions values("Q015","TM002","Complexity of the course is adequate for the particpate level.");
insert into Questions values("Q016","TM002","Case study and practical demos helpful in understanding of the topic");
insert into Questions values("Q017","TM003","The physical environment e.g. classroom space, air-conditioning was conducive to learning.");
insert into Questions values("Q018","TM003","The software/hardware environment provided was adequate for the purpose of the training.");
Select *from Questions;

-- ============================ Student_Status ============================
select * from faculty_details;
select *from batch_details;
desc student_status;
desc student_details;
-- drop table student_status;

insert into student_status values ('A001','O10SQL','2000-12-15','2000-12-25','','','B001','F001');
insert into Student_Status values("A002","O10SQL",'2000-12-15','2000-12-25',"","",'B001','F001');
insert into Student_Status values("A003","O10SQL",'2000-12-15','2000-12-25',"","","B001","F001");
insert into Student_Status values("A001","O10PLSQL",'2001-2-1','2001-2-12',"","","B002","F002");
insert into Student_Status values("A002","O10PLSQL",'2001-2-1','2001-2-12',"","","B002","F002");
insert into Student_Status values("A003","O10PLSQL",'2001-2-1','2001-2-12',"","","B002","F002");
insert into Student_Status values("A001","J2SE",'2002-8-20','2002-10-25',"","","B003","F003");
insert into Student_Status values("A002","J2SE",'2002-8-20','2002-10-25',"","","B003","F003");
insert into Student_Status values("A001","J2EE",'2005-12-1','2005-12-25',"","","B004","F004");
insert into Student_Status values("A002","J2EE",'2005-12-1','2005-12-25',"","","B004","F004");
insert into Student_Status values("A003","J2EE",'2005-12-1','2005-12-25',"","","B004","F004");
insert into Student_Status values("A004","J2EE",'2005-12-1','2005-12-25',"","","B004","F004");
insert into Student_Status values("A005","JAVAFX",'2005-12-4','2005-12-20',"","","B005","F006");
insert into Student_Status values("A006","JAVAFX",'2005-12-4','2005-12-20',"","","B005","F006");
insert into Student_Status values("A006","SQL2008",'2007-6-21','2007-6-28',"","","B006","F007");
insert into Student_Status values("A007","SQL2008",'2007-6-21','2007-6-28',"","","B006","F007");
insert into Student_Status values("A002","MSBI08",'2009-6-26','2009-6-29',"","","B007","F006");
insert into Student_Status values("A003","MSBI08",'2009-6-26','2009-6-29',"","","B007","F006");
insert into Student_Status values("A004","MSBI08",'2009-6-26','2009-6-29',"","","B007","F006");
insert into Student_Status values("A002","ANDRD4",'2010-6-5','2010-6-28',"","","B008","F005");
insert into Student_Status values("A005","ANDRD4",'2010-6-5','2010-6-28',"","","B008","F005");
insert into Student_Status values("A003","ANDRD4",'2011-8-1','2011-8-20',"","","B009","F005");
insert into Student_Status values("A006","ANDRD4",'2011-8-1','2011-8-20',"","","B009","F005");
select *from Student_Status;

-- ============================ Exercise 4 ============================
-- Remove following record form Student_Status table

Delete from Student_Status where Student_Id='A003';
select *from Student_Status;
-- ============================ Exercise 5 ============================
-- Fetch first five faculty who have maximum years of experience & display there details.
select *from faculty_details
order by faculty_experiance desc limit 5;

-- ============================ Exercise 6 ============================
-- Remove table Login_Details from database.
-- drop table Login_Details;
use Exercise2;
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

-- ==================== Exercise 2.4 ==================== 

-- ==================== Exercise 2.5 ==================== 
-- Write a query to display all the Module Name in upper case
select UPPER(Module_Name) from Module_Details;
-- ==================== Exercise 2.6 ==================== 
-- Write a query to display all the characters between 2 to 4 of the Module name column for all the modules in the ModuleDetails table.

-- ==================== Exercise 2.7 ==================== 
-- Write a query which will return the total count of all the students.
select count(Student_Id) from Student_Details;
-- ==================== Exercise 2.8 ==================== 
-- Write a query to display the total faculty members not having their email ID.
select *from Faculty_Details;
select *from Faculty_Details
where Faculty_Email NOT IN (Faculty_Email);
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
select *from Student_Details
where Faculty_ID='F001' and count()>2
group by Start_Date;
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
