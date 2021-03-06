USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[getStephenKingBooksAtCentral]    Script Date: 3/19/2019 12:59:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	ALTER PROC [dbo].[getStephenKingBooksAtCentral]
	AS
	SELECT
	a1.title, a2.number_of_copies
	FROM tbl_books a1
	INNER JOIN tbl_book_copies a2 ON a2.book_title = a1.title
	INNER JOIN tbl_library_branch a3 ON a3.branch_id = a2.branch_id
	INNER JOIN tbl_book_author a4 ON a4.author_id = a1.book_author
	WHERE a3.branch_name = 'Central' AND a4.author_name = 'stephen king'
	;
