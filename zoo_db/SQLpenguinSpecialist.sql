USE [db_zooTest2]
GO
/****** Object:  StoredProcedure [dbo].[penguinSpecialist]    Script Date: 3/20/2019 12:03:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[penguinSpecialist]
AS
SELECT a1.specialist_contact, a1.specialist_fname, a1.specialist_lname,
	   a2.care_type, a3.species_name
		FROM tbl_specialist a1
		INNER JOIN tbl_care a2 ON a2.care_specialist = a1.specialist_id
		INNER JOIN tbl_species a3 ON a3.species_care = a2.care_id
	WHERE species_name = 'penguin';
		