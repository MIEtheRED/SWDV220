/********************************************************************************
* SQL Script for Project 2 SWDV220 - disk_inventoryBM
* Author: Brandon Miethe
* Date: 03/05/2021
*
* Modification Log:
*
* 03/05/2021 Created disk_inventoryBM database
*			 Added intial tables
*			 Created a new user
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
	Media_name varchar(20) not null,
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
	Artist_name varchar(20) not null,
	Band_name varchar(20) not null,
	definition varchar(20)
	);

create table Media_Types
	(Media_type_ID  int not null identity primary key,
	Media_compilation BIT not null,
	Media_music_videos BIT not null,
	Media_box_set BIT not null,
	Artist_ID int not null references Artists(Artist_ID),
	Media_ID int not null references Media_Inventory(Media_ID),
	definition varchar(20)
	);