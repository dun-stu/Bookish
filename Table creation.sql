
Use [Libary management API]


--for testing: allow me to re run the code each time, by droping the table each time
IF OBJECT_ID('dbo.Transactions', 'U') IS NOT NULL
DROP TABLE [dbo].Transactions;
GO

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
DROP TABLE [dbo].[Users];
GO

IF OBJECT_ID('dbo.[Libary Copies]', 'U') IS NOT NULL
DROP TABLE [dbo].[Libary Copies];
GO

IF OBJECT_ID('dbo.Book', 'U') IS NOT NULL
DROP TABLE dbo.[Book];
GO








--
Create table [Libary management API].[dbo].[Book](
	BookID	INT IDENTITY(1,1) PRIMARY KEY,
	Title	VARCHAR(80),
	Author	VARCHAR(30),
	ISBN	VARCHAR(24)
);
GO
--int not working for some reason

Create table [Libary management API].[dbo].[Libary Copies](
	CopyID	INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT,
	FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

Create table [Libary management API].[dbo].[Users](
	UserID		INT IDENTITY(1,1) PRIMARY KEY,
	[Name]		VARCHAR(30),
	Username	VARCHAR(16),
	[Password]	VARCHAR(20)		--to be converted to hash
);

Create table [Libary management API].[dbo].Transactions(
	TransactionID	INT IDENTITY(1,1) PRIMARY KEY,
	BorrowerID		INT,
	BorrowedCopyID	INT,	
	DateBorrowed	DATE,
	DateDue			DATE,
	DateReturned	DATE,
	FOREIGN KEY (BorrowerID) REFERENCES [Users](UserID),
	FOREIGN KEY (BorrowedCopyID) REFERENCES [Libary Copies](CopyID)
);