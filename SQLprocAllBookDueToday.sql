USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[getBooksDueToday]    Script Date: 3/19/2019 12:58:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[getBooksDueToday]
AS
SELECT 
	a1.book_title, a1.date_due,
	a2.branch_name, a3.name, a3.address
	FROM tbl_book_loans a1
	INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
	INNER JOIN tbl_borrower a3 ON a3.card_no = a1.card_no
	WHERE a1.date_due = CONVERT(date, getdate()) AND a2.branch_name = 'Sharpstown';
