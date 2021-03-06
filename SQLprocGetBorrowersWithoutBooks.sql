USE [db_library]
GO
/****** Object:  StoredProcedure [dbo].[getBorrowerWithoutBooks]    Script Date: 3/19/2019 12:59:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[getBorrowerWithoutBooks]
AS
SELECT a1.name
FROM tbl_borrower a1
LEFT JOIN tbl_book_loans a2 ON a2.card_no = a1.card_no
WHERE a2.card_no IS NULL;