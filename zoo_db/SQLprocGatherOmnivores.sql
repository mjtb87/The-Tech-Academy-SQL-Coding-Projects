USE [db_zooTest2]
GO
/****** Object:  StoredProcedure [dbo].[gatherOmnivores]    Script Date: 3/19/2019 11:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[gatherOmnivores]
AS
BEGIN
SELECT * FROM tbl_species WHERE species_order = 3
END