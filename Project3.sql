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
*
*********************************************************************************/


--Create disk_inventoryBM database

use master;
go

drop database if exists disk_inventoryBM;
go

create database disk_inventoryBM;
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
           (null
           ,'Architects'),
		   (null
		   ,'Bring Me the Horizon'),
		   (null
           ,'Avenged Sevenfold'),
		   ('Grimes'
		   , null),
		   ('Deuce'
           , null),
		   (null
		   ,'The Matches'),
		   (null
           ,'Five Finger Death Punch'),
		   (null
		   ,'Daft Punk'),
		   (null
           ,'Van Halen'),
		   (null
		   ,'Escape the Fate'),
		   (null
           ,'Tiger Army'),
		   (null
		   , 'Aerosmith'),
		   (null
           ,'Nine Inch Nails'),
		   ('Marilyn Manson'
		   , null),
		   ('Ozzy Osbourne'
           , null),
		   (null
		   , 'Evanescence'),
		   ('Machine Gun Kelly'
           , null),
		   (null
		   ,'Guns & Roses'),
		   (null
           ,'Metallica'),
		   (null
		   , 'Linkin Park')
GO

--Use this to troubshoot entries
--select * from Artists;

--DELETE FROM [dbo].[Artists]
--      WHERE Artist_ID < 100
--GO

--Insert Disks

INSERT INTO [dbo].[Media_Inventory]
           ([Media_format]
           ,[Media_genre]
           ,[Media_name]
           ,[Media_qty]
           ,[Media_release_date]
           ,[Media_status])
     VALUES
           ('CD'
           ,'Rock'
           ,'The Stage'
           ,1
           ,'10-28-2016'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Post Human: Survival Horror'
           ,1
           ,'10-30-2020'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'City of Evil'
           ,1
           ,'06-06-2005'
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
           ,'American Capitalist'
           ,1
           ,'10-11-2011'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'F8'
           ,1
           ,'02-28-2020'
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
           ,'Classic Rock'
           ,'1984'
           ,1
           ,'01-09-1984'
           ,'Available'),
		   ('CD'
           ,'Classic Rock'
           ,'Aerosmith'
           ,1
           ,'01-05-1973'
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
           ,'Ordinary Man'
           ,1
           ,'02-21-2020'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Fallen'
           ,1
           ,'03-04-2003'
           ,'Available'),
		   ('CD'
           ,'Punk Rock'
           ,'Tickets to My Downfall'
           ,1
           ,'09-25-2020'
           ,'Available'),
		   ('CD'
           ,'Classic Rock'
           ,'Appetite for Destruction'
           ,1
           ,'07-21-1987'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'ReLoad'
           ,1
           ,'09-18-1997'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Hybrid Theory'
           ,1
           ,'10-24-2000'
           ,'Available'),
		   ('CD'
           ,'Rock'
           ,'Warped Tour 2007'
           ,1
           ,'06-05-2007'
           ,'Available')
GO

UPDATE [dbo].[Media_Inventory]
   SET [Media_genre] = 'Hard Rock'
 WHERE Media_name = 'F8';
GO

--Use this to troubshoot entries
--select * from Media_Inventory;

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

INSERT INTO [dbo].[Media_Types]
           ([Media_compilation]
           ,[Media_music_videos]
           ,[Media_box_set]
           ,[Artist_ID]
           ,[Media_ID])
     VALUES
           ('no'
           ,'no'
           ,'no'
           ,3
           ,1),
		   ('no'
           ,'no'
           ,'no'
           ,2
           ,2),
		   ('no'
           ,'no'
           ,'no'
           ,3
           ,3),
		   ('no'
           ,'no'
           ,'no'
           ,4
           ,4),
		   ('no'
           ,'no'
           ,'no'
           ,5
           ,5),
		   ('no'
           ,'no'
           ,'no'
           ,7
           ,6),
		   ('no'
           ,'no'
           ,'no'
           ,7
           ,7),
		   ('no'
           ,'no'
           ,'no'
           ,8
           ,8),
		   ('no'
           ,'no'
           ,'no'
           ,9
           ,9),
		   ('no'
           ,'no'
           ,'no'
           ,9
           ,10),
		   ('no'
           ,'no'
           ,'no'
           ,12
           ,11),
		   ('no'
           ,'no'
           ,'no'
           ,12
           ,12),
		   ('no'
           ,'no'
           ,'no'
           ,13
           ,13),
		   ('no'
           ,'no'
           ,'no'
           ,14
           ,14),
		   ('no'
           ,'no'
           ,'no'
           ,15
           ,15),
		   ('no'
           ,'no'
           ,'no'
           ,16
           ,16),
		   ('no'
           ,'no'
           ,'no'
           ,17
           ,17),
		   ('no'
           ,'no'
           ,'no'
           ,18
           ,18),
		   ('no'
           ,'no'
           ,'no'
           ,19
           ,19),
		   ('no'
           ,'no'
           ,'no'
           ,20
           ,20),
		   ('yes'
           ,'no'
           ,'no'
           ,6
           ,21),
		   ('yes'
           ,'no'
           ,'no'
           ,10
           ,21),
		   ('yes'
           ,'no'
           ,'no'
           ,11
           ,21)
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
