/********************************************************************************
* SQL Script for Project 2, 3 SWDV220 - disk_inventoryBM
* Author: Brandon Miethe
* Date: 03/05/2021
*
* Modification Log:
*
* 03/05/2021 Created disk_inventoryBM database
*			 Added intial tables
*			 Created a new user
* 03/11/2021 Start of project 3
*			 Inserted data into all tables
* 03/12/2021 Edited data in table to meet requirements of project 3
*			 Added compilation disk
* 03/17/2021 Inserted a disk that is on Media_Inventory, but not Media_Types per Project 3 feedback
*			 Outlined statments per rubric for Project 4
*			 Added statments for Project 4 - Errors to be addressed during lab tomorrow commented
* 03/19/2021 Completed query statements for Project 4
*			 Reorganized table data for Media_Inventory, Artists, and Media_Types
*				so that the Media_ID and Artist_ID were properly matched, as well
*				as alphabetizing the data within the tables :)
* 03/31/2021 Started working on Project 5 - Stored Procedures
*			 Created insert, update, and delete stored procedures for Artists, Borrowers, and Media_Inventory
*	
*				
*********************************************************************************/


--Create disk_inventoryBM database

use master;
go

drop database if exists disk_inventoryBM;
go

create database disk_inventoryBM;
go

use disk_inventoryBM;
go
--Create login and user for diskUserBM with read permissions

if SUSER_ID('diskUserBM') is null
	create login diskUserBM
	with password = 'Pa$$w0rd',
	default_database = disk_inventoryBM;
create user diskUserBM;
alter role db_datareader
	add member diskUserBM;
go

--Create Borrowers, Media_Inventory, Loans, Artists, and Media_Types tables

use disk_inventoryBM;

create table Borrowers
	(Borrower_ID int not null identity primary key,
	Borrower_name varchar(60) not null,
	Borrower_phone varchar(15) not null,
	definition varchar(20)
	);

create table Media_Inventory
	(Media_ID int not null identity primary key,
	Media_format varchar(20) not null,
	Media_genre char(20) not null,
	Media_name varchar(60) not null,
	Media_qty tinyint not null,
	Media_release_date date not null,
	Media_status char(60) not null,
	definition varchar(20)
	);

create table Loans
	(Loan_ID int not null identity primary key,
	Loan_out_date date not null,
	Loan_in_date date,
	Borrower_ID int not null references Borrowers(Borrower_ID),
	Media_ID int not null references Media_Inventory(Media_ID),
	definition varchar(20)
	);

create table Artists
	(Artist_ID int not null identity primary key,
	Artist_name varchar(20),
	Band_name varchar(50),
	definition varchar(20)
	);
drop table if exists Media_Types;
create table Media_Types
	(Media_type_ID  int not null identity primary key,
	Media_compilation char(3) not null,
	Media_music_videos char(3) not null,
	Media_box_set char(3) not null,
	Artist_ID int not null references Artists(Artist_ID),
	Media_ID int not null references Media_Inventory(Media_ID),
	definition varchar(20)
	);

--PROJECT 3
--Insert Artists

USE [disk_inventoryBM]
GO

INSERT INTO [dbo].[Artists]
           ([Artist_name]
           ,[Band_name])
     VALUES
           ('Deuce',
		   null),
		   ('Grimes',
		   null),
		   ('Machine Gun Kelly',
		   null),
		   ('Marilyn Manson',
		   null),
		   ('Ozzy Osbourne',
		   null),
		   (null,
		   'Aerosmith'),
		   (null,
		   'Architects'),
		   (null,
		   'Avenged Sevenfold'),
		   (null,
		   'Bring Me the Horizon'),
		   (null,
		   'Daft Punk'),
		   (null,
		   'Escape the Fate'),
		   (null,
		   'Evanescense'),
		   (null,
		   'Five Finger Death Punch'),
		   (null,
		   'Guns & Roses'),
		   (null,
		   'Linkin Park'),
		   (null,
		   'Metallica'),
		   (null,
		   'Nine Inch Nails'),
		   (null,
		   'The Matches'),
		   (null,
		   'Tiger Army'),
		   (null,
		   'Van Halen')

GO

--Use this to troubshoot entries
--select * from Artists;

--DELETE FROM [dbo].[Artists]
--      WHERE Artist_ID < 100
--GO

--Insert Disks

USE [disk_inventoryBM]
GO

INSERT INTO [dbo].[Media_Inventory]
           ([Media_format]
           ,[Media_genre]
           ,[Media_name]
           ,[Media_qty]
           ,[Media_release_date]
           ,[Media_status])
     VALUES
           ('CD',
		   'Classic Rock',
		   '1984',
		   '1',
		   '01-09-1984',
		   'Available'),
		   ('CD',
		   'Classic Rock',
		   'Aerosmith',
		   '1',
		   '01-05-1973',
		   'Available'),
		   ('CD',
		   'Rock',
		   'American Capitalist',
		   '1',
		   '10-11-2011',
		   'Available'),
		   ('CD',
		   'Classic Rock',
		   'Appetite for Destruction',
		   '1',
		   '07-21-1987',
		   'Available'),
		   ('CD',
		   'Rock',
           'City of Evil',
           1,
           '06-06-2005',
           'Available'),
		   ('CD'
           ,'Rock'
           ,'F8'
           ,1
           ,'02-28-2020'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Fallen'
           ,1
           ,'03-04-2003'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Hybrid Theory'
           ,1
           ,'10-24-2000'
           ,'Available'),
		   ('CD'
           ,'Electropop'
           ,'Miss Anthropocene'
           ,1
           ,'02-21-2020'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Nine Lives'
           ,1
           ,'04-24-2012'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Ordinary Man'
           ,1
           ,'02-21-2020'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Post Human: Survival Horror'
           ,1
           ,'10-30-2020'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'ReLoad'
           ,1
           ,'09-18-1997'
           ,'Available'),
		   ('CD'
           ,'Classic Rock'
           ,'Rocks'
           ,1
           ,'05-14-1976'
           ,'Available'),
		   ('CD'
           ,'Industrial'
           ,'The Downward Spiral'
           ,1
           ,'03-08-1994'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'The Pale Emporer'
           ,1
           ,'01-15-2015'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'The Stage'
           ,1
           ,'10-28-2016'
           ,'Available'),
		   ('CD'
           ,'Punk Rock'
           ,'Tickets to My Downfall'
           ,1
           ,'09-25-2020'
           ,'Available'),
		   ('CD'
           ,'Electronic'
           ,'Tron: Legacy'
           ,1
           ,'12-01-2010'
           ,'Available'),
		   ('CD'
           ,'Classic Rock'
           ,'Van Halen'
           ,1
           ,'02-10-1978'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Warped Tour 2007'
           ,1
           ,'06-05-2007'
           ,'Available'),
		   ('Bluray'
           ,'Suspense'
           ,'Se7en'
           ,1
           ,'09-22-1995'
           ,'Available'),
		   ('CD'
           ,'Metal'
           ,'For Those That Wish to Exist'
           ,1
           ,'02-26-2021'
           ,'Available')
GO

--USE [disk_inventoryBM]
--GO

--INSERT INTO [dbo].[Media_Inventory]
--           ([Media_format]
--           ,[Media_genre]
--           ,[Media_name]
--           ,[Media_qty]
--           ,[Media_release_date]
--           ,[Media_status])
--     VALUES
--           ('CD'
--           ,'Metal'
--           ,'For Those That Wish to Exist'
--           ,1
--           ,'02-26-2021'
--           ,'Available')
--GO



USE [disk_inventoryBM]
GO

--Missed disk for Project 2 (In Media_Inventory, but not Media_Types)
--INSERT INTO [dbo].[Media_Inventory]
--           ([Media_format]
--           ,[Media_genre]
--           ,[Media_name]
--           ,[Media_qty]
--           ,[Media_release_date]
--           ,[Media_status])
--     VALUES
--           ('Bluray'
--           ,'Suspense'
--           ,'Se7en'
--           ,1
--           ,'09-22-1995'
--           ,'Available')
--GO



UPDATE [dbo].[Media_Inventory]
   SET [Media_genre] = 'Hard Rock'
 WHERE Media_name = 'F8';
GO

--Use this to troubshoot entries
--use disk_inventoryBM select * from Media_Inventory;

--DELETE FROM [dbo].[Media_Inventory]
--      WHERE  Media_type = 'CD'
--GO

--Insert Borrowers

INSERT INTO [dbo].[Borrowers]
           ([Borrower_name]
           ,[Borrower_phone])
     VALUES
           ('Alan Anderson'
           ,'1234567890'),
		   ('Becky Bledsoe'
           ,'2345678901'),
		   ('Carl Carlson'
           ,'3456789012'),
		   ('Daniella Davidson'
           ,'4567890123'),
		   ('Eric Earnest'
           ,'5678901234'),
		   ('Felicia Figullian'
           ,'6789012345'),
		   ('Gabriel Garso'
           ,'7890123456'),
		   ('Holly Henderson'
           ,'8901234567'),
		   ('Igor Iverson'
           ,'9012345678'),
		   ('Jackie Jenson'
           ,'0123456789'),
		   ('Kevin Kelvin'
           ,'1627384950'),
		   ('Laura Lennon'
           ,'1627384950'),
		   ('Melvin Mizzo'
           ,'6273849501'),
		   ('Nancy Nemassa'
           ,'2738495016'),
		   ('Oliver Olsen'
           ,'7384950162'),
		   ('Penlope Paulson'
           ,'3849501627'),
		   ('Quinton QTellin'
           ,'8495016273'),
		   ('Riley Richards'
           ,'4950162738'),
		   ('Steven Sigesla'
           ,'9501627384'),
		   ('Tamara Tell'
           ,'5016273849'),
		   ('Del Eteme'
		   ,'2088675309')
GO

DELETE FROM [dbo].[Borrowers]
      WHERE  Borrower_ID = 21;
GO

--Use this to troubshoot entries
--select * from Borrowers;

--DELETE FROM [dbo].[Borrowers]
--      WHERE  Borrower_ID < 100
--GO

--Insert Media Types

USE [disk_inventoryBM]
GO

INSERT INTO [dbo].[Media_Types]
           ([Media_compilation]
           ,[Media_music_videos]
           ,[Media_box_set]
           ,[Artist_ID]
           ,[Media_ID])
     VALUES
           ('no',
		   'no',
		   'no',
		   1,
		   10),
		   ('no',
		   'no',
		   'no',
		   2,
		   9),
		   ('no',
		   'no',
		   'no',
		   3,
		   18),
		   ('no',
		   'no',
		   'no',
		   4,
		   16),
		   ('no',
		   'no',
		   'no',
		   5,
		   11),
		   ('no',
		   'no',
		   'no',
		   6,
		   2),
		   ('no',
		   'no',
		   'no',
		   6,
		   14),
		   ('no',
		   'no',
		   'no',
		   7,
		   23),
		   ('no',
		   'no',
		   'no',
		   8,
		   5),
		   ('no',
		   'no',
		   'no',
		   8,
		   17),
		   ('no',
		   'no',
		   'no',
		   9,
		   12),
		   ('no',
		   'no',
		   'no',
		   10,
		   19),
		   ('yes',
		   'no',
		   'no',
		   11,
		   21),
		   ('no',
		   'no',
		   'no',
		   12,
		   7),
		   ('no',
		   'no',
		   'no',
		   13,
		   3),
		   ('no',
		   'no',
		   'no',
		   13,
		   6),
		   ('no',
		   'no',
		   'no',
		   14,
		   4),
		   ('no',
		   'no',
		   'no',
		   15,
		   8),
		   ('no',
		   'no',
		   'no',
		   16,
		   13),
		   ('no',
		   'no',
		   'no',
		   17,
		   15),
		   ('yes',
		   'no',
		   'no',
		   18,
		   21),
		   ('yes',
		   'no',
		   'no',
		   19,
		   21),
		   ('no',
		   'no',
		   'no',
		   20,
		   1),
		   ('no',
		   'no',
		   'no',
		   20,
		   20)

GO
--Use this to troubshoot entries
--select * from Media_Types;

--DELETE FROM [dbo].[Media_Types]
--      WHERE  Media_type_ID < 100
--GO

--Insert Loans

INSERT INTO [dbo].[Loans]
           ([Loan_out_date]
           ,[Borrower_ID]
           ,[Media_ID])
     VALUES
		   ('03-01-2021'
           ,1
           ,1),
		   ('03-01-2021'
           ,2
           ,3),
           ('03-11-2021'
           ,1
           ,1),
		   ('03-11-2021'
           ,2
           ,2),
		   ('03-11-2021'
           ,3
           ,3),
		   ('03-11-2021'
           ,4
           ,4),
		   ('03-11-2021'
           ,5
           ,5),
		   ('03-11-2021'
           ,6
           ,6),
		   ('03-11-2021'
           ,7
           ,7),
		   ('03-11-2021'
           ,8
           ,8),
		   ('03-11-2021'
           ,9
           ,9),
		   ('03-11-2021'
           ,10
           ,10),
		   ('03-11-2021'
           ,11
           ,11),
		   ('03-11-2021'
           ,12
           ,12),
		   ('03-11-2021'
           ,13
           ,13),
		   ('03-11-2021'
           ,14
           ,14),
		   ('03-11-2021'
           ,15
           ,15),
		   ('03-11-2021'
           ,16
           ,16),
		   ('03-11-2021'
           ,17
           ,17),
		   ('03-11-2021'
           ,18
           ,18),
		   ('03-11-2021'
           ,19
           ,19),
		   ('03-12-2021'
		   ,19
		   ,21)
GO

UPDATE [dbo].[Loans]
   SET [Loan_in_date] = '03-05-2021'
 WHERE Loan_out_date = '03-01-2021'
GO

--use this to troubleshoot entries
--select * from Loans;

--DELETE FROM [dbo].[Loans]
--      WHERE Loan_ID < 100;
--GO

--Query to select disks that are out on loan and have not been returned

select Borrower_ID, Media_ID, Loan_out_date, Loan_in_date
from Loans
where Loan_in_date is null;



--PROJECT 4

--Show the disks in your database and any associated Individual artists only.
use disk_inventoryBM;
select Media_name as 'Disk Name', Media_release_date as 'Release Date',
	Ltrim(SubString(Artist_name, 1, Isnull(Nullif(CHARINDEX(' ', Artist_name), 0), 1000))) As 'Artist First Name',
	Ltrim(SUBSTRING(Artist_name,Isnull(Nullif(CHARINDEX(' ',Artist_name,Charindex(' ',Artist_name)+1),0),CHARINDEX(' ',Artist_name)),
		Case when Charindex(' ',Artist_name)=0 then 0 else LEN(Artist_name) end)) as 'Artist Last Name'
from Media_Inventory
join Artists on Media_Inventory.Media_ID = Artists.Artist_ID
where Artist_name is not null
order by [Artist Last Name];


--Create a view called View_Individual_Artist that shows the artists’ names and not group names.
--Include the artist id in the view definition but do not display the id in your output.

use disk_inventoryBM;
drop view if exists View_Individual_Artists;
go
create view View_Individual_Artists
as
select Artist_ID,
	Ltrim(SubString(Artist_name, 1, Isnull(Nullif(CHARINDEX(' ', Artist_name), 0), 1000))) As 'Artist First Name',
	Ltrim(SUBSTRING(Artist_name,Isnull(Nullif(CHARINDEX(' ',Artist_name,Charindex(' ',Artist_name)+1),0),CHARINDEX(' ',Artist_name)),
		Case when Charindex(' ',Artist_name)=0 then 0 else LEN(Artist_name) end)) as 'Artist Last Name'
from Artists
where Artist_name is not null;
go

select [Artist First Name], [Artist Last Name]
from View_Individual_Artists
order by [Artist Last Name];

--Show the disks in your database and any associated Group artists only.

select Media_name as 'Disk Name', Media_release_date as 'Release Date', Band_name as 'Band Name'
from Media_Inventory
join Media_Types on Media_Inventory.Media_ID = Media_Types.Media_ID
join Artists on Media_Types.Artist_ID = Artists.Artist_ID
where Band_name is not null
order by Media_name;

--Re-write the previous query using the View_Individual_Artist view. Do not redefine the view.
--Use ‘NOT EXISTS’ or ‘NOT IN’ as the only restriction in the WHERE clause. The output matches the output from the previous query.

select Media_name as 'Disk Name', Media_release_date as 'Release Date', Band_name as 'Band Name'
from Media_Inventory
join Media_Types on Media_Inventory.Media_ID = Media_Types.Media_ID
join Artists on Media_Types.Artist_ID = Artists.Artist_ID
where Artists.Artist_ID not in (select Artist_ID from View_Individual_Artists)
order by Media_name;

--Show the borrowed disks and who borrowed them.

select Ltrim(SubString(Borrower_name, 1, Isnull(Nullif(CHARINDEX(' ', Borrower_name), 0), 1000))) As 'First Name',
	Ltrim(SUBSTRING(Borrower_name,Isnull(Nullif(CHARINDEX(' ',Borrower_name,Charindex(' ',Borrower_name)+1),0),CHARINDEX(' ',Borrower_name)),
		Case when Charindex(' ',Borrower_name)=0 then 0 else LEN(Borrower_name) end)) as 'Last Name',
		Media_name as 'Disk Name',
		Loan_out_date as 'Date Borrowed',
		Loan_in_date as 'Date Returned'
from Loans
join Media_Inventory on Loans.Media_ID = Media_Inventory.Media_ID
join Borrowers on Loans.Borrower_ID = Borrowers.Borrower_ID
order by [Last Name];

--Show the number of times a disk has been borrowed.

select Loans.Media_ID, Media_name as 'Disk Name', count(mi.Media_ID) as 'Times Borrowed' -- not count(*), don't want to count nulls
from Loans
join Media_Inventory as mi on mi.Media_ID = Loans.Media_ID
group by Loans.Media_ID, Media_name
order by Media_ID asc;

--Show the disks outstanding or on-loan and who has each disk.

select Media_name as 'Disk Name',
	Loan_out_date as 'Date Borrowed',
	Loan_in_date as 'Date Returned',
	Ltrim(SUBSTRING(Borrower_name,Isnull(Nullif(CHARINDEX(' ',Borrower_name,Charindex(' ',Borrower_name)+1),0),CHARINDEX(' ',Borrower_name)),
		Case when Charindex(' ',Borrower_name)=0 then 0 else LEN(Borrower_name) end)) as 'Last Name'
from Loans
join Media_Inventory on Loans.Media_ID = Media_Inventory.Media_ID
join Borrowers on Loans.Borrower_ID = Borrowers.Borrower_ID
where Loan_in_date is null
order by Media_name asc;




----------------------------------------------------------Project 5----------------------------------------------------------------------------------
use disk_inventoryBM;
go

--Create stored procedures for Artists
--Drop and create stored procedure for inserting into the Artists table
drop proc if exists sp_ins_artist;
go
create proc sp_ins_artist @Artist_name varchar(20), @Band_name varchar(50)
as
begin try
	INSERT INTO [dbo].[Artists]
			   ([Artist_name]
			   ,[Band_name])
		 VALUES
			   (@Artist_name
			   ,@Band_name)
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
GO
grant execute on sp_ins_artist to diskUserBM;
go
exec sp_ins_artist null, 'A Day to Remember'
go

--Drop and create stored procedure for updating the Artists table
drop proc if exists sp_upd_artist;
go
create proc sp_upd_artist @Artist_ID int, @Artist_name varchar(20), @Band_name varchar(50)
as
begin try
	UPDATE [dbo].[Artists]
	   SET [Artist_name] = @Artist_name
		  ,[Band_name] = @Band_name
	 WHERE Artist_ID = @Artist_ID
 end try
 begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
 end catch
GO
grant execute on sp_upd_artist to diskUserBM;
go
exec sp_upd_artist 21, 'Updated', 'A Day to Remember'
go

--Drop and create stored procedure for deleting from the Artists table
drop proc if exists sp_del_artist;
go
create proc sp_del_artist @Artist_ID int
as
begin try
	DELETE FROM [dbo].[Artists]
		  WHERE Artist_ID = @Artist_ID
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
GO
grant execute on sp_del_artist to diskUserBM;
go
exec sp_del_artist 21
go

--Create SP for Borrowers
--Drop and create stored procedure for inserting into the Borrowers table
drop proc if exists sp_ins_borrower;
go
create proc sp_ins_borrower @Borrower_name varchar(60), @Borrower_phone varchar(15)
as
begin try
	INSERT INTO [dbo].[Borrowers]
			   ([Borrower_name]
			   ,[Borrower_phone])
		 VALUES
			   (@Borrower_name
			   ,@Borrower_phone)
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
GO
grant execute on sp_ins_borrower to diskUserBM;
go
exec sp_ins_borrower 'Brandon Miethe', '208-602-8410'
go

--Drop and create stored procedure for updating the Borrowers table
drop proc if exists sp_upd_borrower;
go
create proc sp_upd_borrower @Borrower_ID int, @Borrower_name varchar(60), @Borrower_phone varchar(15)
as
begin try
UPDATE [dbo].[Borrowers]
   SET [Borrower_name] = @Borrower_name
      ,[Borrower_phone] = @Borrower_phone
 WHERE Borrower_ID = @Borrower_ID
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
GO
grant execute on sp_upd_borrower to diskUserBM;
go
exec sp_upd_borrower 22, 'Mrandon Biethe', '014-820-6802'
go

--Drop and create stored procedure for deleting from the Borrowers table
drop proc if exists sp_del_borrower;
go
create proc sp_del_borrower @Borrower_ID int
as
begin try
DELETE FROM [dbo].[Borrowers]
      WHERE Borrower_ID = @Borrower_ID
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
GO
grant execute on sp_del_borrower to diskUserBM;
go
exec sp_del_borrower 22
go

--Create SP for Media_Inventory
--Drop and create stored procedure for inserting into the Media_Inventory table
drop proc if exists sp_ins_disk;
go
create proc sp_ins_disk
	@Media_format varchar(20), @Media_genre char(20), @Media_name varchar(60), @Media_qty tinyint, @Media_release_date date, @Media_status char(60)
as
begin try
	INSERT INTO [dbo].[Media_Inventory]
			   ([Media_format], [Media_genre], [Media_name], [Media_qty], [Media_release_date], [Media_status])
		 VALUES
			   (@Media_format, @Media_genre, @Media_name, @Media_qty, @Media_release_date, @Media_status);
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
go
grant execute on sp_ins_disk to diskUserBM;
go
exec sp_ins_disk 'CD', 'Rock', 'Ride the Lightning', 1, '07-27-1984', 'Available'
go

--Drop and create stored procedure for updating the Media_Inventory table
drop proc if exists sp_upd_disk;
go
create proc sp_upd_disk
	@Media_ID int, @Media_format varchar(20), @Media_genre char(20), @Media_name varchar(60), @Media_qty tinyint, @Media_release_date date, @Media_status char(60)
as
begin try
	UPDATE [dbo].[Media_Inventory]
	   SET [Media_format] = @Media_format
		  ,[Media_genre] = @Media_genre
		  ,[Media_name] = @Media_name
		  ,[Media_qty] = @Media_qty
		  ,[Media_release_date] = @Media_release_date
		  ,[Media_status] = @Media_status
	 WHERE Media_ID = @Media_ID
 end try
 begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
 end catch
GO
grant execute on sp_upd_disk to diskUserBM;
go
exec sp_upd_disk 1, 'CD', 'Classic Rock', '1984 Updated', 1, '01-09-1984', 'Available'
go


--Drop and create stored procedure for deleting from the Media_Inventory table

drop proc if exists sp_del_disk;
go
create proc sp_del_disk @Media_ID int
as
begin try
delete from dbo.Media_Inventory
	where Media_ID = @Media_ID
end try
begin catch
	print 'An error occured.';
	print 'Message: ' + convert(varchar(200), error_message());
end catch
GO
grant execute on sp_del_disk to diskUserBM;
go
exec sp_del_disk 24;
go

----------------------------------------------------------PLAYGROUND-------------------------------------------------------------------------------------
select * from Artists;

select * from Borrowers;

select * from Media_Inventory;
