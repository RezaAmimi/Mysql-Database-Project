USE [HW3_Tuples (1)]
GO
/****** Object:  Table [dbo].[classroom]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[classroom](
	[building] [varchar](20) NOT NULL,
	[room_number] [int] NOT NULL,
	[capacity] [int] NULL,
 CONSTRAINT [class_pk] PRIMARY KEY CLUSTERED 
(
	[building] ASC,
	[room_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[course]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[course](
	[course_id] [varchar](20) NOT NULL,
	[title] [varchar](100) NULL,
	[credits] [int] NOT NULL,
 CONSTRAINT [PK_course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[department]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[dept_name] [varchar](20) NOT NULL,
	[building] [varchar](20) NOT NULL,
	[budget] [numeric](10, 0) NOT NULL,
	[dept_course] [varchar](20) NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[dept_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grade]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grade](
	[GPA] [varchar](4) NULL,
	[stud_id] [varchar](20) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[instructor](
	[instructor_id] [varchar](20) NOT NULL,
	[first_name] [varchar](20) NOT NULL,
	[salary] [numeric](10, 0) NOT NULL,
	[inst_dept] [varchar](20) NOT NULL,
	[last_name] [varchar](20) NOT NULL,
	[middle_name] [varchar](20) NULL,
 CONSTRAINT [PK_instructor] PRIMARY KEY CLUSTERED 
(
	[instructor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[section]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[section](
	[sec_id] [varchar](10) NOT NULL,
	[semester] [int] NOT NULL,
	[year] [int] NOT NULL,
	[sec_course] [varchar](20) NOT NULL,
	[building] [varchar](20) NOT NULL,
	[room_number] [int] NOT NULL,
	[time_slot_id] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sec_id] ASC,
	[semester] ASC,
	[year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[ID] [varchar](20) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[tot_cred] [int] NOT NULL,
	[stud_dept] [varchar](20) NOT NULL,
	[advisor] [varchar](20) NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[time_slot]    Script Date: 10/30/2021 7:50:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[time_slot](
	[time_slot_id] [varchar](20) NOT NULL,
	[day_of_month] [varchar](20) NULL,
	[start_time] [datetime] NOT NULL,
	[end_time] [datetime] NOT NULL,
 CONSTRAINT [time_slot_id_pk] PRIMARY KEY CLUSTERED 
(
	[time_slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[department]  WITH CHECK ADD FOREIGN KEY([dept_course])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [stud_id_fk] FOREIGN KEY([stud_id])
REFERENCES [dbo].[student] ([ID])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [stud_id_fk]
GO
ALTER TABLE [dbo].[instructor]  WITH CHECK ADD  CONSTRAINT [inst_dept_fk] FOREIGN KEY([inst_dept])
REFERENCES [dbo].[department] ([dept_name])
GO
ALTER TABLE [dbo].[instructor] CHECK CONSTRAINT [inst_dept_fk]
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD FOREIGN KEY([building], [room_number])
REFERENCES [dbo].[classroom] ([building], [room_number])
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD FOREIGN KEY([time_slot_id])
REFERENCES [dbo].[time_slot] ([time_slot_id])
GO
ALTER TABLE [dbo].[section]  WITH CHECK ADD  CONSTRAINT [sec_course_fk] FOREIGN KEY([sec_course])
REFERENCES [dbo].[course] ([course_id])
GO
ALTER TABLE [dbo].[section] CHECK CONSTRAINT [sec_course_fk]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([stud_dept])
REFERENCES [dbo].[department] ([dept_name])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [stud_advisor_fk] FOREIGN KEY([advisor])
REFERENCES [dbo].[instructor] ([instructor_id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [stud_advisor_fk]
GO


/* INSERT OPERATIONS */

USE [HW3_Tuples (1)]
GO

INSERT INTO [dbo].[student]
           ([ID]
           ,[name]
           ,[tot_cred]
           ,[stud_dept]
           ,[advisor])
     VALUES
                 ('1427391','Chester','15','MIS','Dane'),
		   ('1427371','Kenzie','13','Chemistry', '786286'),
		   ('1427392','Kyla','19','CSE', '172646'),
		   ('1427361','Nick','12','Accounting', '172746'),
		   ('1427393','Brayan','15','History', '125465'),
		   ('1427351','Gia','19','Finance', '104721'),
		   ('1427394','Natasha','14','Medicine', '996525'),
		   ('1427341','Harley','17','SCM', '106521'),
		   ('1427395','Alexa','18','English', '993325'),
		   ('1427331','Nehemiah','20','Accounting', '172746'),
		   ('1427396','Siri','18','Mathamatics', '366510'),
		   ('1427321','Zeel','16','MIS', '126965'),
		   ('1427397','Ali','17','CSE', '172646'),
		   ('1427311','Prerna','18','MSBA', '165473'),
		   ('1427398','Zoey','9','Biology', '786586'), 
		   ('1427399','Edith','9','Arts', ‘139295’),
  	   ('1427143','Nishitha','15','MIS', '126965'),
		   ('1427322','Bentley','9','CSE', '172646'),
		   ('1427381','Sunny','10','MSBA', '165473'),
		   ('1427323','Tripp','9','Psychology', '165546');
GO

USE [HW3_Tuples (1)]
GO

INSERT INTO [dbo].[instructor]
           ([instructor_id]
           ,[first_name]
           ,[salary]
           ,[inst_dept]
           ,[last_name]
           ,[middle_name])
     VALUES
('126965', 'Dane','120000','MIS','Esquivel','Erwin'),
('786286', 'Arjun','150000','Chemistry','Reddy','Gill'),
('139295', 'Petra','80000','Arts','Clements','Hunt'),
('182546', 'Lillie','75000','Music','Hensley','Rose'),
('993325', 'Romeo','90000','English','Colby','Moon'),
('164473', 'Saif','89000','Mechanical','Hobbs','Yusuf'),
('857185', 'Jeffery','12000','Urban Planning', 'Oscar', 'Jr'),
('104721', 'Alfonso','200000','Finance','Holmes','Le'),  
('362010', 'Zaki','110000','Economics','Bennett','Joel'),
('172746', 'Lucian','180000','Accounting','Garza','Dawn'),
('125465', 'Rene','125000','History','Graham','Moore'),
('786586', 'Kabir','15500','Biology','Singh','Ch'),
('1365295', 'Russell','85000','Cybersecurity','Quinn','Bell'),
('165546', 'Sakina','75500','Psychology','Parsons','Avila'),
('996525', 'Tristin','95000','Medicine','Sosa','Kye'),
('165473', 'Octavia','89500','MSBA','Finch','Soto'),
('856585', 'Joel','12500','MBA','Sims','Le'),
('106521', 'Abbigail','210000','SCM','Sanders','Robson'),
('366510', 'Oscar','115000','Mathmatics','Bennett','Cook'),
('172646', 'Ayse','160000','CSE','Gonzalez','Coombes');

GO


insert into department
  values ('Accounting','Shimao','45000'),
		('Arts','Bowler','62000'),
		('Biology','Uzumaki','67000'),
		('Chemistry','Maddison','90000'),
		('CSE','Adams','50000'),
		('Cybersecurity','Tianjin','95000'),
		('Economics','Hawking','65000'),
		('English','Marry','86000'),
		('Finance','Dalian','74000'),
		('History','Michel','90000'),
		('Mathmatics','Marina','89000'),
		('MBA','Musk','80000'),
		('Mechanical','Rose','98000'),
		('Medicine','Teresa','100000'),
		('MIS','Jackson','65000'),
		('MSBA','Rudolph','70000'),
		('Music','Hunt','120000'),
		('Psychology','Laktha','65000'),
		('SCM','Taylor','59000'),
		('Urban Planning','Holmes','67000');
GO

alter table course
alter column title varchar (100);


insert into course (course_id,title,credits)
Values ('IDS 521','ADMS',4),
('IDS 572','Data Mining',4),
('IDS 564','Social Media Analysis',4),
('IDS 400','Programming for Data Science in Business',4),
('IDS 567','Data Visualization',2),
('IDS 552','Supply Chain Management',4),
('IDS 566','Text Analytics',2),
('IDS 507','Advanced Systems Analysis and Design Project',4),
('IDS 576','Deep Learning',4),
('IDS 575','Machine Learning',4),
('IDS 517','Enterprise Application Development',4),
('IDS 520','Enterprise Information Infrastructure Planning & Security',4),
('IDS 561','Data Analytics',4),
('ACTG 500','Introduction to Financial Accounting',4),
('IDS 556','Introduction to Managerial Accounting',4),
('IDS 580','Java',4),
('CS 450','Introduction to Networking',3),
('CS 523','Multi-Media Systems',4),
('CS 526','Computer Graphics II',4),
('CS 527','Computer Animation',4);

select * from course;

insert into classroom (building,room_number,capacity)
values('Maddison',10,50),
('Jackson',20,100),
('Rudolph',30,75),
('Rose',15,60),
('Taylor',3,30),
('Thor',5,50),
('Musk',60,45),
('Bowler',2,50),
('Marry',1,55),
('Michel',8,50),
('Hunt',6,70),
('Tianjin',9,25),
('Lakhta',11,80),
('Willis',7,100),
('Marina',22,40),
('Dalian',40,35),
('Hanking',210,65),
('Uzumaki',200,50),
('Torch',220,85),
('Shimao',250,90);

select * from classroom

alter table time_slot
alter column day_of_month varchar (20);


insert into time_slot (time_slot_id,day_of_month,start_time,end_time)
values ('IDS 400 - 1','Monday','15:30:00.000','18:00:00.000'),
('IDS 400 - 2','Friday','13:00:00.000','15:00:00.000'),
('IDS 572 - 2','Wednesday','18:00:00.000','20:30:00.000'),
('IDS 572 - 1','Friday','16:30:00.000','18:00:00.000'),
('IDS 521 - 1','Saturday','12:30:00.000','15:30:00.000'),
('IDS 521 - 2','Monday','12:30:00.000','14:00:00.000'),
('IDS 564 - 1','Monday','15:30:00.000','18:00:00.000'),
('IDS 564 - 2','Thursday','15:30:00.000','18:00:00.000'),
('CS 450 - 1','Monday','15:30:00.000','18:00:00.000'),
('CS 450 - 2','Wednesday','16:30:00.000','18:00:00.000'),
('CS 523 - 1','Monday','15:30:00.000','18:00:00.000'),
('CS 523 - 2','Saturday','15:30:00.000','18:00:00.000'),
('CS 526 - 1','Tuesday','15:30:00.000','18:00:00.000'),
('CS 526 - 2','Saturday','17:30:00.000','19:00:00.000'),
('CS 527 - 1','Monday','17:30:00.000','20:00:00.000'),
('CS 527 - 2','Thursday','15:30:00.000','18:00:00.000'),
('IDS 580  - 1','Monday','10:30:00.000','13:00:00.000'),
('IDS 580 - 2','Tuesday','15:30:00.000','18:00:00.000'),
('IDS 517 - 1','Thursday','15:30:00.000','18:00:00.000'),
('IDS 517 - 2','Monday','15:45:00.000','18:15:00.000'),
('IDS 520 - 1','Wednesday','15:45:00.000','18:15:00.000'),
('IDS 520 - 2','Friday','15:00:00.000','18:45:00.000'),
('ACTG 500 - 1','Thursday','16:30:00.000','18:30:00.000'),
('ACTG 500 - 2','Saturday','19:30:00.000','20:30:00.000'),
('IDS 507 - 1','Thursday','15:30:00.000','18:00:00.000'),
('IDS 507 - 2','Thursday','18:30:00.000','20:30:00.000'),
('IDS 552 - 1','Wednesday','15:30:00.000','18:00:00.000'),
('IDS 552 - 2','Thursday','19:30:00.000','20:00:00.000'),
('IDS 575 - 1','Thursday','15:30:00.000','18:00:00.000'),
('IDS 575 - 2','Monday','10:30:00.000','13:00:00.000');

select * from time_slot


insert into section (sec_id,semester,year,sec_course,building,room_number,time_slot_id)
values (1,1,2021,'IDS 400','Bowler',2,'IDS 400 - 1'),
(2,1,2021,'IDS 400','Bowler',2,'IDS 400 - 2'),
(3,2,2021,'IDS 572','Taylor',3,'IDS 572 - 1'),
(4,3,2021,'CS 523','Jackson',20,'CS 523 - 1'),
(5,1,2021,'IDS 575','Marry',1,'IDS 575 - 1'),
(8,3,2021,'CS 523','Jackson',20,'CS 523 - 2');


select * from section

/*SELECT QUERIES */

/* SQL Queries */

SELECT name as StudentName,tot_cred as CreditsTaken,stud_dept as Department
FROM dbo.student
ORDER BY name ASC


SELECT stud_dept as Department,count(ID) as NumberOfStudents
FROM dbo.student
GROUP BY stud_dept
ORDER BY NumberOfStudents DESC,department ASC


SELECT top 5 stud_dept as Department,max(tot_cred) as MaxCreditsTaken
FROM dbo.student
GROUP BY stud_dept
ORDER BY MaxCreditsTaken DESC,department ASC


with table1 as (SELECT advisor as AdID,count(ID) as NumberOfStudents
FROM dbo.student
GROUP BY advisor
)

select AdID as AdvisorID,Concat(i.first_name,' ',i.last_name) as AdvisorName,t.NumberOfStudents
from table1 t left outer join dbo.instructor i
on t.AdID=i.instructor_id
ORDER BY t.NumberOfStudents DESC

  SELECT inst_dept as Department,CAST(AVG(salary) AS decimal(18,2)) as AverageSalary
  FROM dbo.instructor
  GROUP BY inst_dept
  ORDER BY AverageSalary Desc


   with AverageDepartmentSalary as ( SELECT inst_dept as Department,CAST(AVG(salary) AS   decimal(18,2)) as AverageSalary
  FROM dbo.instructor
  GROUP BY inst_dept)


  SELECT a.Department,
  CASE WHEN a.AverageSalary>(select AVG(salary) from dbo.instructor) THEN 'High'
  WHEN a.AverageSalary=(select AVG(salary) from dbo.instructor) THEN 'Same as Average'
  ELSE 'Low'
  END AS SalaryRange 
  FROM AverageDepartmentSalary a


 with AverageDepartmentSalary as ( SELECT inst_dept as Department,CAST(AVG(salary) AS decimal(18,2)) as AverageSalary
  FROM dbo.instructor
  GROUP BY inst_dept)
  , classifiedSalary as (

  SELECT a.Department,
  CASE WHEN a.AverageSalary>(select AVG(salary) from dbo.instructor) THEN 'High'
  WHEN a.AverageSalary=(select AVG(salary) from dbo.instructor) THEN 'Same as Average'
  ELSE 'Low'
  END AS SalaryRange 
  FROM AverageDepartmentSalary a)

select SalaryRange,Count(*) as DepartmentCount from classifiedSalary 
GROUP BY SalaryRange



SELECT dept_name as Department,budget,building
FROM dbo.department
WHERE budget= (select MAX(budget) from department)
UNION ALL
SELECT dept_name as Department,budget,building
FROM dbo.department
WHERE budget= (select MIN(budget) from department)



SELECT S.ID, S.name,G.GPA
FROM dbo.student S LEFT OUTER JOIN dbo.grade AS G
ON S.ID=G.stud_id
ORDER BY G.GPA DESC,S.name ASC



WITH DEPT_GRADE AS (SELECT S.stud_dept as Department,AVG(CAST(G.GPA AS float)) as AverageGrade
FROM dbo.student S LEFT OUTER JOIN dbo.grade AS G
ON S.ID=G.stud_id
GROUP BY S.stud_dept)

SELECT Department,
CASE WHEN AverageGrade>=3.5 THEN 'High Grade'
WHEN AverageGrade<3 THEN 'Low Grade'
ELSE 'Medium Grade'
END AS Performance
FROM DEPT_GRADE


 SELECT building,room_number
  FROM dbo.classroom
  WHERE capacity>50


  select s.sec_course,c.title
   from dbo.section s left outer join dbo.course c
   on s.sec_course=c.course_id
   where s.semester=1 or s.semester=2


     select s.sec_course,c.title,c.credits
   from dbo.section s left outer join dbo.course c
   on s.sec_course=c.course_id
   where title like '%data%'



     select s.year as GradYear,s.building,s.room_number,s.semester,s.sec_course,t.day_of_month,t.start_time,t.end_time
   from dbo.section s left outer join dbo.time_slot t
   on s.time_slot_id=t.time_slot_id 


 select t.day_of_month as ClassDay,count(t.sec_course) as NumberofCourses
   from ( select s.year as GradYear,s.building,s.room_number,s.semester,s.sec_course,t.day_of_month,t.start_time,t.end_time
   from dbo.section s left outer join dbo.time_slot t
   on s.time_slot_id=t.time_slot_id)t
   group by t.day_of_month


   with data1 as ( select s.year as GradYear,s.building,s.room_number,s.semester,s.sec_course,t.day_of_month
   from dbo.section s left outer join dbo.time_slot t
   on s.time_slot_id=t.time_slot_id )

   select *,case when day_of_month in ('Monday','Tuesday','Wednesday','Thursday','Friday') then 'Week Day'
   else 'Weekend'
   end as ClassSchDay
   from data1


 with data1 as ( select s.year as GradYear,s.building,s.room_number,s.semester,s.sec_course,t.day_of_month
   from dbo.section s left outer join dbo.time_slot t
   on s.time_slot_id=t.time_slot_id )


   select d.*,c.capacity
   from data1 d left outer join dbo.classroom c
   on d.building=c.building and d.room_number=c.room_number
   where d.semester=1 or d.semester=3



  select credits,count(*) as Subjects
  from dbo.course c
  group by credits


  select credits,title
  from dbo.course c
  where c.title like '%Graphics%' and credits=4


  select ID,name,stud_dept as Department,
  case when tot_cred>8 and tot_cred<=15 then 'Moderate'
  when tot_cred<=8 then 'Low'
  else 'High'
  end as CourseWork
from dbo.student 




