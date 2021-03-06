USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[getTheLostTribeCount]    Script Date: 3/19/2019 1:00:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[getTheLostTribeCount] 
AS
SELECT
		a1.book_title, a2.branch_name,
		a1.number_of_copies
		FROM tbl_book_copies a1
		INNER JOIN tbl_library_branch a2 ON a2.branch_id = a1.branch_id
		WHERE a1.book_title = 'the lost tribe' 