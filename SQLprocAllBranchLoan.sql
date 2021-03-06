USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[getAllBranchLoanCount]    Script Date: 3/19/2019 12:55:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[getAllBranchLoanCount]
AS
SELECT 
	a1.branch_name, COUNT(a2.book_title) AS 'loaned books'
	FROM tbl_library_branch a1
	INNER JOIN tbl_book_loans a2 ON a2.branch_id = a1.branch_id
	GROUP BY a1.branch_name
