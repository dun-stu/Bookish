--for testing: allow me to re run the code each time, by droping the table each time
IF OBJECT_ID('dbo.[Book]', 'U') IS NOT NULL
DROP TABLE dbo.[Book];
GO

IF OBJECT_ID('[dbo].Transactions', 'U') IS NOT NULL
DROP TABLE [dbo].Transactions;
GO

IF OBJECT_ID('[dbo].[Libary Copies]', 'U') IS NOT NULL
DROP TABLE [dbo].[Libary Copies];
GO

IF OBJECT_ID('[dbo].[Users]', 'U') IS NOT NULL
DROP TABLE [dbo].[Users];
GO

Create table [Libary management API].[dbo].[Book](
	BookID	VARCHAR(15) PRIMARY KEY,
	Title	VARCHAR(30),
	Author	VARCHAR(30),
	ISBN	VARCHAR(24)
);
GO
--int not working for some reason

Create table [Libary management API].[dbo].[Libary Copies](
	CopyID	VARCHAR(15) PRIMARY KEY,
	FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

Create table [Libary management API].[dbo].Transactions(
	TransactionID	VARCHAR(15)	PRIMARY KEY,
	FOREIGN KEY (BorrowerID) REFERENCES [Users](UserID),
	FOREIGN KEY (BorrowedCopyID) REFERENCES [Libary Copies](CopyID),
	DateBorrowed	DATE,
	DateDue			DATE,
	DateReturned	DATE
);

Create table [Libary management API].[dbo].[Users](
	UserID		VARCHAR(15)	PRIMARY KEY,
	[Name]		VARCHAR(30),
	Username	VARCHAR(16),
	Password	VARCHAR(20)		--to be converted to hash
);

