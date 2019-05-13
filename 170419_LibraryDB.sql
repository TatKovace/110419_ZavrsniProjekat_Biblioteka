-- T-SQL code for Library database
-- CREATE DATABASE Library
-- USE Library

PRINT N'Creating Library.author...';

CREATE TABLE author ( 
id bigint NOT NULL IDENTITY(1,1), 
a_name nvarchar(250) NOT NULL, 
a_yearB int NOT NULL, 
a_yearD int,
a_descr nvarchar(max),
a_img nvarchar(250),
PRIMARY KEY (id) 
); 

PRINT N'Creating Library.genre...';

CREATE TABLE genre ( 
id bigint NOT NULL IDENTITY(1,1), 
g_name nvarchar(250) NOT NULL, 
PRIMARY KEY (id) 
);
 
PRINT N'Creating Library.book...';

CREATE TABLE book ( 
id bigint NOT NULL IDENTITY(1,1), 
b_num nvarchar(20) NOT NULL,
b_name nvarchar(250) NOT NULL, 
author_id bigint NOT NULL, 
b_year int,
b_descr nvarchar(max),
b_img nvarchar(250),
PRIMARY KEY (id)
); 

CREATE INDEX book_fk1 ON book (author_id);

PRINT N'Creating Library.bookGenre...';

CREATE TABLE bookGenre (
book_id bigint NOT NULL,
genre_id bigint NOT NULL
);

CREATE INDEX bookGenre_fk1 ON bookGenre (genre_id);

PRINT N'Creating Library.member...';

CREATE TABLE member ( 
id bigint NOT NULL IDENTITY(1,1), 
m_cnum bigint NOT NULL, 
m_fname nvarchar(250) NOT NULL, 
m_lname nvarchar(250) NOT NULL, 
m_snum nvarchar(13) NOT NULL, 
m_address nvarchar(250), 
m_city nvarchar(250),
m_tel nvarchar(50), 
m_datemem date NOT NULL, 
PRIMARY KEY (id) 
); 

PRINT N'Creating Library.doctype...';

CREATE TABLE doctype ( 
id bigint NOT NULL IDENTITY(1,1), 
d_type varchar(50), 
PRIMARY KEY (id) 
); 

select * from doctype

PRINT N'Creating Library.document...';

CREATE TABLE document ( 
id bigint NOT NULL IDENTITY(1,1), 
d_date date, 
doctype_id bigint, 
member_id bigint, 
PRIMARY KEY (id)
); 

CREATE INDEX document_ix1 ON document (doctype_id); 
CREATE INDEX document_ix2 ON document (member_id);
 
PRINT N'Creating Library.documentDetails...';

CREATE TABLE documentDetails ( 
id bigint NOT NULL IDENTITY(1,1), 
dd_borrow int, 
dd_return int, 
document_id bigint, 
book_id bigint, 
PRIMARY KEY (id)
);
 
CREATE INDEX documentDetails_ix1 ON documentDetails (document_id); 
CREATE INDEX documentDetails_ix2 ON documentDetails (book_id); 

PRINT N'Creating Library.person...';

CREATE TABLE person (
id bigint NOT NULL IDENTITY(1,1),
p_user nvarchar(50),
PRIMARY KEY (id)
);

insert into person (p_user) values 
('Admin'),
('Librarian'),
('Member');

PRINT N'Creating Library.administrator...';

CREATE TABLE administrator (
id bigint NOT NULL IDENTITY(1,1),
admin_fname nvarchar(250),
admin_lname nvarchar(250),
admin_username nvarchar(250),
admin_password nvarchar(250),
person_id bigint DEFAULT 1,
PRIMARY KEY (id)
);

PRINT N'Creating Library.librarian...';

CREATE TABLE librarian (
id bigint NOT NULL IDENTITY(1,1),
l_fname nvarchar(250),
l_lname nvarchar(250),
l_username nvarchar(250),
l_password nvarchar(250),
person_id bigint DEFAULT 2,
PRIMARY KEY (id)
);

PRINT N'Creating Library.bookGenre...';

CREATE TABLE memberOnline (
id bigint NOT NULL IDENTITY(1,1),
member_id bigint,
m_username nvarchar(250),
m_password nvarchar(250),
m_email nvarchar(250),
person_id bigint DEFAULT 3,
PRIMARY KEY (id)
);

PRINT N'Alter tables...';

ALTER TABLE document ADD CONSTRAINT document_fk2 FOREIGN KEY (member_id) REFERENCES member (id)
ALTER TABLE document ADD CONSTRAINT document_fk1 FOREIGN KEY (doctype_id) REFERENCES doctype (id)
ALTER TABLE documentDetails ADD CONSTRAINT documentDetails_fk2 FOREIGN KEY (book_id) REFERENCES book (id)
ALTER TABLE documentDetails ADD CONSTRAINT documentDetails_fk1 FOREIGN KEY (document_id) REFERENCES document (id)

ALTER TABLE bookGenre ADD CONSTRAINT bookGenre_fk2 FOREIGN KEY (genre_id) REFERENCES genre (id)
ALTER TABLE bookGenre ADD CONSTRAINT bookGenre_fk1 FOREIGN KEY (book_id) REFERENCES book (id)
ALTER TABLE book ADD CONSTRAINT book_fk1 FOREIGN KEY (author_id) REFERENCES author (id)

ALTER TABLE administrator ADD CONSTRAINT admin_fk1 FOREIGN KEY (person_id) REFERENCES person (id)
ALTER TABLE librarian ADD CONSTRAINT librarian_fk1 FOREIGN KEY (person_id) REFERENCES person (id)
ALTER TABLE memberOnline ADD CONSTRAINT memOnline_fk2 FOREIGN KEY (person_id) REFERENCES person (id)
ALTER TABLE memberOnline ADD CONSTRAINT memOnline_fk1 FOREIGN KEY (member_id) REFERENCES member (id)

PRINT N'Initial values for Library.author...';

insert into author (a_name, a_yearB, a_yearD, a_descr) values 
('Philip K. Dick', 1928, 1982, ''),
('Theodore Dreiser', 1871, 1945, '');

PRINT N'Initial values for Library.genre...';

insert into genre (g_name) values 
('Science Fiction'),
('Fiction'),
('Romance'),
('Thriller'),
('History'),
('War'),
('Detective story'),
('Dystopia'),
('Horror');

PRINT N'Initial values for Library.book...';

insert into book (b_num, b_name, author_id, b_year, b_descr) values 
('34818133', 'Do Androids Dream of Electric Sheep?', 1, 1968, ''),
('620385', 'An American Tragedy', 2, 1925, '')

PRINT N'Initial values for Library.bookGenre...';

insert into bookGenre(book_id, genre_id) values 
(1, 1),
(1, 8),
(2, 2),
(2, 4);

-- Altering tables

-- USE Library

PRINT N'Altering table memberOnline, adding column m_date...'
ALTER TABLE memberOnline ADD m_date date
-- Last login date

PRINT N'Altering table memberOnline, adding column m_time...'
ALTER TABLE memberOnline ADD m_time time(0)
-- Last login time

--1Online

PRINT N'Altering table member, adding unique m_cnum...'
ALTER TABLE member ADD CONSTRAINT member_uq1 UNIQUE (m_cnum)
-- Unique Membership card No

--ALTER TABLE member DROP CONSTRAINT member_uq1; 

PRINT N'Initial values for Library.bookGenre...';

insert into member (m_cnum, m_fname, m_lname, m_snum, m_address, m_city, m_tel, m_datemem) values 
(100001, 'Donald', 'Duck', '1234567890123', '123 Rosewood Lane', 'New York', '055/1111-222', '2010-02-15'),
(100002, 'Mickey', 'Mouse', '1234567890124', '47 Newbridge Dr.', 'New York', '055/1111-233', '2015-06-27')

-- Procedure for adding memberOnline
PRINT N'Creating Stored Procedure InsertMemberOnline'
GO
CREATE PROCEDURE InsertMemberOnline
(
@Member_cnum bigint,
@M_useername nvarchar(250),
@M_password nvarchar(250),
@M_email nvarchar(250)
)
AS
INSERT INTO memberOnline (member_id, m_username, m_password, m_email, person_id, m_date, m_time) VALUES
((SELECT id FROM member WHERE m_cnum = @Member_cnum), @M_useername, @M_password, @M_email, DEFAULT, GETDATE(), GETDATE())

-- drop procedure InsertMemberOnline
-- EXECUTE InsertMemberOnline 100002, 'drugi', 'druga', 'tralala@gmail.com'

update memberOnline
set m_date=GETDATE(), m_time=GETDATE()
where member_id=1

/*
PRINT N'Creating Stored Procedure UpdateMemberOnline...';
GO

CREATE PROCEDURE UpdateMemberOnline
( @M_id bigint )
AS
UPDATE memberOnline SET m_date=GETDATE(), m_time=GETDATE()
WHERE member_id=@M_id

-- DROP PROCEDURE UpdateMemberOnline
-- EXECUTE UpdateMemberOnline 1
*/

PRINT N'Creating Stored Procedure UpdateMemberOnline...';
GO
CREATE PROCEDURE UpdateMemberOnline
( @M_username nvarchar(250) )
AS
UPDATE memberOnline SET m_date=GETDATE(), m_time=GETDATE()
WHERE m_username=@M_username;
GO
-- DROP PROCEDURE UpdateMemberOnline
-- EXECUTE UpdateMemberOnline drugi

SELECT * FROM memberOnline

-- 1 -- Write query to select book genre.
SELECT genre.g_name [Genre] FROM genre
INNER JOIN bookGenre
ON genre.id = bookGenre.genre_id
INNER JOIN book
ON bookGenre.book_id = book.id
WHERE book.b_name = 'Do Androids Dream of Electric Sheep?'

-- 2 -- Write query to select all books with all their gere in single column devided by ', '
CREATE PROCEDURE Proc_BookGenre
( @Book_id bigint )
AS
SELECT genre.g_name [Genre] FROM genre
INNER JOIN bookGenre
ON genre.id = bookGenre.genre_id
INNER JOIN book
ON bookGenre.book_id = book.id
WHERE book.id = @Book_id

-- DROP PROCEDURE Proc_BookGenre
EXEC Proc_BookGenre 2

SELECT book.b_name, genre.g_name [Genre] FROM genre
INNER JOIN bookGenre
ON genre.id = bookGenre.genre_id
INNER JOIN book
ON bookGenre.book_id = book.id
ORDER BY 1

SELECT book.b_num [Book No], book.b_name [Book name], author.a_name [Author], book.b_year [Publish year], genre.g_name [Genre]
FROM book
INNER JOIN author
ON book.author_id = author.id
INNER JOIN bookGenre
ON book.id = bookGenre.book_id
INNER JOIN genre
ON bookGenre.genre_id = genre.id
ORDER BY 2

CREATE VIEW [View_BookGenreRaw]
AS
SELECT book.b_num [Book No], book.b_name [Book name], author.a_name [Author], book.b_year [Publish year], genre.g_name [Genre]
FROM book
INNER JOIN author
ON book.author_id = author.id
INNER JOIN bookGenre
ON book.id = bookGenre.book_id
INNER JOIN genre
ON bookGenre.genre_id = genre.id
GO

SELECT * FROM View_BookGenreRaw
ORDER BY 2

SELECT [Book No], [Book name], [Author], [Publish year],
	STUFF((SELECT ', ' + [Genre] FROM View_BookGenreRaw A
WHERE A.[Book name]=B.[Book name] FOR XML PATH('')),1,1,'') As [Genre]
FROM View_BookGenreRaw B
GROUP BY [Book name], [Book No], [Author], [Publish year]

CREATE VIEW [View_BookGenre]
AS
SELECT [Book No], [Book name], [Author], [Publish year],
	STUFF((SELECT ', ' + [Genre] FROM View_BookGenreRaw A
WHERE A.[Book name]=B.[Book name] FOR XML PATH('')),1,1,'') As [Genre]
FROM View_BookGenreRaw B
GROUP BY [Book name], [Book No], [Author], [Publish year]

SELECT * FROM View_BookGenre
order by 3

-- 3 -- Insert values for 5 authors and their 19 books
insert into author (a_name, a_yearB, a_yearD) values 
('Charles Dickens', 1812, 1870),
('Frederik Pohl', 1919, 2013),
('Nick Hornby', 1957, null);

select * from author

insert into book (b_num, b_name, author_id, b_year) values 
('837684377', 'Flow My Tears, the Policeman Said', 1, 1974),
('1085966199', 'Ubik', 1, 1969),
('13348354', 'Jennie Gerhardt ', 2, 1911),
('920239685', 'Oliver Twist', 3, 1839),
('690103641', 'Nicholas Nickleby', 3, 1839),
('645549002', 'David Copperfield', 3, 1850),
('965916552', 'Little Dorrit', 3, 1857),
('908071509', 'Martin Chuzzlewit', 3, 1844),
('702552336', 'Dombey and Son', 3, 1848),
('960049264', 'Great Expectations', 3, 1861),
('689920616', 'Gateway', 4, 1977),
('43650138', 'The Far Shore of Time', 4, 1999),
('865174399', 'Man Plus', 4, 1976),
('439995815', 'The Merchants War', 4, 1984),
('968166420', 'High Fidelity', 5, 1995),
('515486717', 'High Fidelity', 5, 1995),
('971789054', 'About a Boy', 5, 1998)

select * from book
select * from genre

insert into genre (g_name) values 
('Novel')

insert into bookGenre(book_id, genre_id) values 
(3, 10),
(3, 1),
(4, 10),
(4, 1),
(5, 2),
(6, 10),
(7, 10),
(8, 10),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(13, 1),
(14, 10),
(14, 1),
(15, 10),
(15, 1),
(16, 10),
(16, 1),
(17, 10),
(18, 10),
(19, 10);

insert into doctype (d_type) values 
('Borrowed'),
('Returned')

-- 4 -- insert values for 8 members
insert into member (m_cnum, m_fname, m_lname, m_snum, m_address, m_city, m_tel, m_datemem) values 
(100003, 'Flinn', 'Rider', '1234567890125', '147 Shirley Court', 'New York', '055/1111-244', '2011-01-15'),
(100004, 'Minnie', 'Mouse', '1234567890126', '47 Newbridge Dr.', 'New York', '055/1111-233', '2015-06-27'),
(100005, 'Daisy', 'Duck', '1234567890127', '123 Rosewood Lane', 'New York', '055/1111-222', '2018-07-25'),
(100006, 'Eugene', 'Fitzherberty', '1234567890128', '22 Cambridge Street', 'New York', '055/1111-255', '2017-10-07'),
(100007, 'Peter', 'Pan', '1234567890129', '155 Arcadia Street', 'New York', '055/1111-266', '2017-03-05'),
(100008, 'Merida', 'DunBroch', '1234567890130', '755 Trusel St.', 'New York', '055/1111-277', '2019-04-20');

select * from member

-- 5 -- insert values for 8 document
insert into document (d_date, doctype_id, member_id) values 
('2016-05-01', 1, 1),
('2016-05-10', 2, 1),
('2016-05-02', 1, 2),
('2016-05-11', 2, 2),
('2017-03-01', 1, 3),
('2017-03-02', 1, 4),
('2017-03-15', 2, 3),
('2017-03-16', 2, 4);

-- 6 -- insert values for documentDetails
insert into documentDetails (dd_borrow, dd_return, document_id, book_id) values 
(1, 0, 1, 5),
(1, 0, 1, 1),
(1, 0, 1, 18),
(0, 1, 2, 5),
(0, 1, 2, 1),
(1, 0, 3, 11),
(1, 0, 3, 10),
(1, 0, 3, 15),
(0, 1, 4, 15),
(0, 1, 4, 11),
(1, 0, 5, 3),
(1, 0, 5, 7),
(1, 0, 6, 13),
(1, 0, 6, 11),
(0, 1, 7, 3),
(0, 1, 7, 7),
(0, 1, 8, 11);

-- 7 -- show Book Card 
SELECT book.id [Book ID], book.b_name [Book's Name], author.a_name [Author], 
document.d_date, doctype.d_type [Borrowed/Returned], member.id [Member ID], 
member.m_fname + ' ' + member.m_lname [Member full name]
FROM book LEFT JOIN author
ON book.author_id = author.id
LEFT JOIN documentDetails
ON book.id = documentDetails.book_id 
LEFT JOIN document
ON documentDetails.document_id = document.id
LEFT JOIN doctype
ON document.doctype_id = doctype.id
LEFT JOIN member
ON document.member_id = member.id

CREATE VIEW [View_BookCard]
AS
SELECT book.id [Book ID], book.b_name [Book's Name], author.a_name [Author], 
document.d_date [Document date], doctype.d_type [Borrowed/Returned], member.id [Member ID], 
member.m_fname + ' ' + member.m_lname [Member full name]
FROM book LEFT JOIN author
ON book.author_id = author.id
LEFT JOIN documentDetails
ON book.id = documentDetails.book_id 
LEFT JOIN document
ON documentDetails.document_id = document.id
LEFT JOIN doctype
ON document.doctype_id = doctype.id
LEFT JOIN member
ON document.member_id = member.id

SELECT * FROM View_BookCard
-- DROP VIEW View_BookCard

GO
CREATE PROCEDURE [Proc_BookCard]
( @Book_id bigint )
AS
SELECT * FROM View_BookCard
WHERE [Book ID] = @Book_id
GO

EXECUTE Proc_BookCard 1
-- DROP PROCEDURE Proc_BookCard

-- 8 -- show available books on certain day
CREATE FUNCTION [Func_BookSatus] 
( @F_date DATE)
RETURNS TABLE
AS
RETURN 
(SELECT [View_BookCard].*, ROW_NUMBER() over(partition by [Book ID] order by [Document date] desc) as rownum 
FROM [View_BookCard] 
WHERE ISNULL([Document date], CAST('1000-01-01' AS date)) <= @F_date)

SELECT * FROM Func_BookSatus('2017-01-01')
where rownum = 1
EXCEPT 
SELECT * FROM Func_BookSatus('2017-01-01')
where rownum = 1 AND [Borrowed/Returned] = 'Borrowed'

GO
CREATE PROCEDURE [Proc_AvailableBooks]
( @A_date DATE )
AS
SELECT * FROM Func_BookSatus(@A_date)
where rownum = 1
EXCEPT 
SELECT * FROM Func_BookSatus(@A_date)
where rownum = 1 AND [Borrowed/Returned] = 'Borrowed'
GO

EXECUTE Proc_AvailableBooks '2019-05-14'

CREATE FUNCTION [Func_AvailableBooks] 
( @F_date DATE)
RETURNS TABLE
AS
RETURN
SELECT * FROM Func_BookSatus(@F_date)
where rownum = 1
EXCEPT 
SELECT * FROM Func_BookSatus(@F_date)
where rownum = 1 AND [Borrowed/Returned] = 'Borrowed'

SELECT * FROM Func_AvailableBooks ('2019-05-14')

-- 9 -- show borrower's card on certain day, and again all that with books that are not returned 

SELECT [Member ID], [Member full name], [Document date], [Borrowed/Returned], [Book ID],
[Book's Name], [Author] FROM Func_BookSatus('2017-01-01')
where rownum = 1 AND [Borrowed/Returned] = 'Borrowed'
-- AND [Member ID] = 2

	-- (show full borrower's card) (create procedure or function for that last select...)

