-- I see it now. Thanks Christian!

CREATE TABLE Author(
ID varchar(10),
AuthorName VARCHAR(250) NOT NULL,
Unique(ID),
PRIMARY KEY(ID)
);

CREATE TABLE Book(
ISBN varchar(15),
Title varchar(250),
Edition varchar(10),
YearIssued int not null,
PRIMARY KEY(ISBN)
);

CREATE TABLE Copy(
barCode varchar(10),
Book_ID varchar(15),
PRIMARY KEY(barCode),
FOREIGN KEY(Book_ID) REFERENCES Book(ISBN)
);

CREATE TABLE Authorship(
ID int not null AUTO_INCREMENT,
Book_ID varchar(15),
Author_ID varchar(10),
Main boolean,
PRIMARY KEY(ID),
FOREIGN KEY(Book_ID) REFERENCES Book(ISBN),
FOREIGN KEY(Author_ID) REFERENCES Author(ID)
);

CREATE TABLE Member(
ID int not null auto_increment,
MemberName varchar(250),
Gender ENUM('1','2'),
email varchar(250),
PRIMARY KEY(ID)
);

CREATE TABLE Loan(
ID int not null auto_increment,
copyID varchar(10),
memberID int,
borrowDate Date,
returnDate Date,
status ENUM('1','2','3'),
PRIMARY KEY(ID),
FOREIGN KEY(copyID) REFERENCES Copy(barCode),
FOREIGN KEY(memberID) REFERENCES Member(ID)
);
