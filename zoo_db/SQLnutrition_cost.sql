USE [db_zooTest2]
GO
/****** Object:  StoredProcedure [dbo].[nutritionCost]    Script Date: 3/20/2019 12:02:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[nutritionCost]
AS
SELECT nutrition_cost FROM tbl_nutrition WHERE nutrition_cost <= 600.00
