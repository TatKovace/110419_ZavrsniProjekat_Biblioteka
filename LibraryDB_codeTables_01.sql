-- Code for T-SQL Library database

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

PRINT N'Altering table memberOnline, adding column m_date...'
ALTER TABLE memberOnline ADD m_date date;
-- Last login date

PRINT N'Altering table memberOnline, adding column m_time...'
ALTER TABLE memberOnline ADD m_time time(0);
-- Last login time

PRINT N'Altering table member, adding unique m_cnum...'
ALTER TABLE member ADD CONSTRAINT member_uq1 UNIQUE (m_cnum);
-- Unique Membership card No
-- ALTER TABLE member DROP CONSTRAINT member_uq1; 

PRINT N'Initial values for Library.bookGenre...';

insert into member (m_cnum, m_fname, m_lname, m_snum, m_address, m_city, m_tel, m_datemem) values 
(100001, 'Donald', 'Duck', '1234567890123', '123 Rosewood Lane', 'New York', '055/1111-222', '2010-02-15'),
(100002, 'Mickey', 'Mouse', '1234567890124', '47 Newbridge Dr.', 'New York', '055/1111-233', '2015-06-27');

-- SELECT * FROM member
-- SELECT * FROM memberOnline

PRINT N'Creating Stored Procedure InsertMemberOnline...';
GO
CREATE PROCEDURE InsertMemberOnline
(
@Member_cnum bigint,
@M_username nvarchar(250),
@M_password nvarchar(250),
@M_email nvarchar(250)
)
AS
INSERT INTO memberOnline (member_id, m_username, m_password, m_email, person_id, m_date, m_time) VALUES
((SELECT id FROM member WHERE m_cnum = @Member_cnum), @M_username, @M_password, @M_email, DEFAULT, GETDATE(), GETDATE());
GO
-- drop procedure InsertMemberOnline;
-- EXECUTE InsertMemberOnline 100002, 'drugi', 'druga', 'tralala@gmail.com'

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