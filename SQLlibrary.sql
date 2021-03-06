USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[library_db]    Script Date: 3/19/2019 12:45:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[library_db]
AS

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(50) PRIMARY KEY NOT NULL,
	address VARCHAR(50) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books(
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	title VARCHAR(50) UNIQUE NOT NULL,
	publisher_name VARCHAR(50) NOT NULL	CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE,
	book_author INT NOT NULL CONSTRAINT fk_author_name FOREIGN KEY REFERENCES tbl_book_author(author_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_author(
	author_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	author_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_copies(
	book_title VARCHAR(50) NOT NULL CONSTRAINT fk_title FOREIGN KEY REFERENCES tbl_books(title) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT 
);

CREATE TABLE tbl_book_loans(
	book_title VARCHAR(50) NOT NULL CONSTRAINT fk_title_loan FOREIGN KEY REFERENCES tbl_books(title) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id_load FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL CONSTRAINT fk_card_no_loan FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE,
	date_due DATE
);

CREATE TABLE tbl_borrower(
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	name VARCHAR(50),
	address VARCHAR(50),
	phone VARCHAR(50)
);

INSERT INTO tbl_library_branch
	(branch_name, address)
	VALUES
	('Sharpstown', '5252 E Lawn St. Denver, CO'),
	('Central', '7800 S Way Wy. Denver, CO'),
	('Uptown', '4786 N North St. Denver, CO'),
	('Downtown', '12700 W West Wy. Denver, CO')
; 

INSERT INTO tbl_publisher
	(publisher_name, address, phone)
	VALUES
	('we the publishers', '5977 N View St. Philadelphia, PA', '215-555-5555'),
	('oh publisher my publisher', '2000 E Here Rd. Celebration, FL', '407-456-3322'),
	('the last of the publishers', '5738 S South St. Burbank, CA', '343-355-7721')
;

INSERT INTO tbl_book_author
	(author_name)
	VALUES
	('author mchauthorson'),
	('douglas hofstadter'),
	('stephen king'),
	('edwin abbot'),
	('david goggins'),
	('thoth'),
	('albert camus'),
	('terry pratchett'),
	('george carlin'),
	('don edward beck-christopher c. cowan'),
	('sam harris'),
	('RZA'),
	('terence mckenna'),
	('chuck palahniuk'),
	('osho'),
	('hunter s. thompson'),
	('s.e. hinton'),
	('kurt vonnegut')
;


INSERT INTO tbl_books
	(title, publisher_name, book_author)
	VALUES
	('the lost tribe', 'we the publishers', 1),
	('godel escher bach', 'oh publisher my publisher', 2),
	('the stand', 'the last of the publishers', 3),
	('flatland', 'the last of the publishers', 4),
	('can''t hurt me', 'the last of the publishers', 5),
	('the hermetica', 'oh publisher my publisher', 6),
	('the myth of sisyphus', 'oh publisher my publisher', 7),
	('reaper man', 'oh publisher my publisher', 8), 
	('brain droppings ', 'oh publisher my publisher', 9),
	('spiral dynamics', 'oh publisher my publisher', 10),
	('free will', 'oh publisher my publisher', 11),
	('the tao of wu', 'oh publisher my publisher', 12),
	('true hallucinations', 'we the publishers', 13),	
	('food of the gods', 'we the publishers', 13),
	('mort', 'oh publisher my publisher', 8),
	('night watch', 'oh publisher my publisher', 8),
	('small gods', 'oh publisher my publisher', 8),
	('it', 'the last of the publishers', 3),
	('misery', 'the last of the publishers', 3),
	('the shining', 'the last of the publishers', 3),
	('pet sematary', 'the last of the publishers', 3),
	('the stranger', 'oh publisher my publisher', 7),
	('napalm and silly putty', 'oh publisher my publisher', 9),
	('waking up', 'oh publisher my publisher', 11),
	('fight club', 'oh publisher my publisher', 14),
	('choke', 'oh publisher my publisher', 14),
	('invisible', 'oh publisher my publisher', 14),
	('snuff', 'oh publisher my publisher', 14),
	('invisible monster', 'oh publisher my publisher', 14),
	('courage', 'we the publishers', 15),
	('intuition', 'we the publishers', 15),
	('awareness', 'we the publishers', 15),
	('intimacy', 'we the publishers', 15),
	('creativity', 'we the publishers', 15),
	('joy', 'we the publishers', 15),
	('fear', 'we the publishers', 15),
	('the mind''s i', 'oh publisher my publisher', 2),
	('i am a strange loop', 'oh publisher my publisher', 2),
	('metamagical themas', 'oh publisher my publisher', 2),
	('surfaces and essences', 'oh publisher my publisher', 2),
	('fear and loathing in las vagas', 'the last of the publishers', 16),
	('hell''s angels', 'the last of the publishers', 16),
	('the rum diary', 'the last of the publishers', 16),
	('the outsiders', 'the last of the publishers', 17),
	('rumble fish', 'the last of the publishers', 17),
	('tex', 'the last of the publishers', 17),
	('that was then, this is now', 'the last of the publishers', 17),
	('cat''s cradle', 'we the publishers', 18),
	('player piano', 'we the publishers', 18),
	('mother night', 'we the publishers', 18)
;


INSERT INTO tbl_book_copies
	(book_title, branch_id, number_of_copies)
	VALUES
	('the lost tribe', 1, 1),
	('godel escher bach', 3, 2),
	('the stand', 4, 3),
	('flatland', 4, 4),
	('can''t hurt me', 4, 5),
	('the hermetica', 4, 6),
	('the myth of sisyphus', 3, 7),
	('reaper man', 3, 8), 
	('brain droppings ', 2, 9),
	('spiral dynamics', 1, 10),
	('free will', 1, 11),
	('the tao of wu', 1, 12),
	('true hallucinations', 2, 13),	
	('food of the gods', 3, 13),
	('mort', 4, 8),
	('night watch', 4, 8),
	('small gods', 4, 8),
	('it', 2, 3),
	('misery', 3, 3),
	('the shining', 2, 3),
	('pet sematary', 2, 3),
	('the stranger', 1, 7),
	('napalm and silly putty', 1, 9),
	('waking up', 2, 11),
	('fight club', 1, 14),
	('choke', 1, 14),
	('invisible', 3, 14),
	('snuff', 3, 14),
	('invisible monster', 1, 14),
	('courage', 3, 15),
	('intuition', 2, 15),
	('awareness', 1, 15),
	('intimacy', 4, 15),
	('creativity', 4, 15),
	('joy', 2, 15),
	('fear', 2, 15),
	('the mind''s i', 3, 2),
	('i am a strange loop', 3, 2),
	('metamagical themas', 4, 2),
	('surfaces and essences', 2, 2),
	('fear and loathing in las vagas', 1, 16),
	('hell''s angels', 2, 16),
	('the rum diary', 3, 16),
	('the outsiders', 4, 17),
	('rumble fish', 1, 17),
	('tex', 2, 17),
	('that was then, this is now', 3, 17),
	('cat''s cradle', 4, 18),
	('player piano', 1, 18),
	('mother night', 2, 18),
	('the lost tribe',	2,	6),
	('godel escher bach', 2,	4),
	('the stand', 3, 10),
	('flatland', 3, 7),
	('can''t hurt me',	2,	5),
	('the hermetica',	2,	6),
	('the myth of sisyphus',	1,	7),
	('reaper man',	1,	8),
	('brain droppings', 4,	7),
	('spiral dynamics',	2,	10),
	('free will',	2,	11),
	('the tao of wu',	4,	12),
	('true hallucinations',	4,	17),
	('food of the gods', 2,	7),
	('mort', 2,	8),
	('night watch',	2,	8),
	('small gods',	1,	8),
	('it',	1,	5),
	('misery',	1,	6),
	('the shining',	1,	6),
	('pet sematary',	3,	5),
	('the stranger',	3,	7),
	('napalm and silly putty',	2,	9),
	('waking up',	3,	9),
	('fight club',	3,	10),
	('choke',	3,	10),
	('invisible',	3,	9),
	('snuff',	3,	10),
	('invisible monster',	2,	12),
	('courage',	1, 13),
	('intuition', 3, 13),
	('awareness', 2, 11),
	('intimacy', 2,	10),
	('creativity',	3,	10),
	('joy',	4,	7),
	('fear', 4,	9),
	('the mind''s i',	2,	9),
	('i am a strange loop',	1,	10),
	('metamagical themas', 1,	12),
	('surfaces and essences', 3,	5),
	('fear and loathing in las vagas',	3,	5),
	('hell''s angels', 3,	5),
	('the rum diary', 2,	6),
	('the outsiders', 1,	7),
	('rumble fish',	2,	15),
	('tex',	1,	10),
	('that was then, this is now',	1,	10),
	('cat''s cradle', 2,	11),
	('player piano', 1,	14),
	('mother night', 2,	10)
;

INSERT INTO tbl_book_loans
	(book_title, branch_id, card_no, date_out, date_due)
	VALUES
	('the lost tribe', 1, 1, '2019-05-20', '2019-05-25'),
	('godel escher bach', 3, 2, '2019-05-20', '2019-05-25'),
	('the stand', 4, 3, '2019-05-20', '2019-05-25'),
	('flatland', 4, 4, '2019-05-20', '2019-05-27'),
	('can''t hurt me', 4, 5, '2019-05-20', '2019-05-27'),
	('the hermetica', 4, 6, '2019-05-20', '2019-05-27'),
	('the myth of sisyphus', 3, 7, '2019-05-20', '2019-05-27'),
	('reaper man', 3, 8, '2019-05-20', '2019-05-29'),  
	('brain droppings ', 2, 9, '2019-05-20', '2019-05-29'),
	('spiral dynamics', 1, 10, '2019-05-20', '2019-06-01'),
	('free will', 1, 1, '2019-05-20', '2019-06-01'),
	('the tao of wu', 1, 2, '2019-05-20', '2019-06-02'),
	('true hallucinations', 2, 3, '2019-05-20', '2019-06-02'),	
	('food of the gods', 3, 4, '2019-05-20', '2019-06-03'),
	('mort', 4, 5, '2019-05-20', '2019-06-04'),
	('night watch', 4, 6, '2019-05-20', '2019-06-04'),
	('small gods', 4, 7, '2019-05-20', '2019-06-04'),
	('it', 2, 8, '2019-05-20', '2019-06-08'),
	('misery', 3, 9, '2019-05-20', '2019-06-08'),
	('the shining', 2, 10, '2019-05-20', '2019-06-10'),
	('pet sematary', 2, 1, '2019-05-20', '2019-06-10'),
	('the stranger', 1, 1, '2019-05-20', '2019-06-11'),
	('napalm and silly putty', 1, 1, '2019-05-20', '2019-06-11'),
	('waking up', 2, 1, '2019-05-20', '2019-06-11'),
	('fight club', 1, 1, '2019-05-20', '2019-06-13'),
	('choke', 1, 1, '2019-05-20', '2019-06-13'),
	('invisible', 3, 5, '2019-05-20', '2019-06-14'),
	('snuff', 3, 5, '2019-05-20', '2019-06-14'),
	('invisible monster', 1, 5, '2019-05-20', '2019-06-15'),
	('courage', 3, 5, '2019-05-20', '2019-06-15'),
	('intuition', 2, 5, '2019-05-20', '2019-06-15'),
	('awareness', 1, 3, '2019-05-20', '2019-06-16'),
	('intimacy', 4, 3, '2019-05-20', '2019-06-16'),
	('creativity', 4, 7, '2019-05-20', '2019-06-16'),
	('joy', 2, 7, '2019-05-20', '2019-06-17'),
	('fear', 2, 7, '2019-05-20', '2019-06-17'),
	('the mind''s i', 3, 8, '2019-05-20', '2019-06-17'),
	('i am a strange loop', 3, 8, '2019-05-20', '2019-06-18'),
	('metamagical themas', 4, 8, '2019-05-20', '2019-06-19'),
	('surfaces and essences', 2, 2, '2019-05-20', '2019-06-20'),
	('fear and loathing in las vagas', 1, 2, '2019-05-20', '2019-06-20'),
	('hell''s angels', 2, 2, '2019-05-20', '2019-06-21'),
	('the rum diary', 3, 9, '2019-05-20', '2019-06-21'),
	('the outsiders', 4, 9, '2019-05-20', '2019-06-21'),
	('rumble fish', 1, 10, '2019-05-20', '2019-06-22'),
	('tex', 2, 10, '2019-05-20', '2019-06-22'),
	('that was then, this is now', 3, 9, '2019-05-20', '2019-06-22'),
	('cat''s cradle', 4, 4, '2019-05-20', '2019-06-23'),
	('player piano', 1, 4, '2019-05-20', '2019-06-24'),
	('mother night', 2, 4, '2019-05-20', '2019-06-24')
;


INSERT INTO tbl_borrower
	(name, address, phone)
	VALUES
	('john smith', '782 E Chestnut St. Denver CO', '310-374-4333'),
	('mary thomson', '4321 W Chase St. Denver CO', '310-224-5743'),
	('mark boston', '1010 E Walnut St. Denver CO', '310-322-3466'),
	('joey bagadonuts', '5280 E Jasmine Ln. Denver CO', '310-234-3324'),
	('karren o', '58 N Hallway Rd. Denver CO', '310-984-8994'),
	('oliver street', '2228 S Follow Rd. Denver CO', '456-774-5594'),
	('marky mark', '700 N 4th Rd. Denver CO', '456-777-6677'),
	('larry sellers', '450 N 56th St. Denver CO', '456-567-6009'),
	('jackie treehorn', '1000 N 89th St. Denver CO', '456-122-1211'),
	('jeffrey lebowski', '2099 W Hastings St. Denver CO', '356-555-3222')
;