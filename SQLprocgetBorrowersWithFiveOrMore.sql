USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[getBorrowersWithFiveOrMore]    Script Date: 3/19/2019 12:58:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	ALTER PROC [dbo].[getBorrowersWithFiveOrMore]
	AS
	SELECT
	a1.name, a1.address,
	a1.phone
	FROM tbl_borrower a1
	INNER JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
	GROUP BY a1.name, a1.address, a1.phone	
	HAVING COUNT(a2.card_no) > 1;
