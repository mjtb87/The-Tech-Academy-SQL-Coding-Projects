USE [db_zooTest2]
GO
/****** Object:  StoredProcedure [dbo].[speciesNutrition]    Script Date: 3/20/2019 12:03:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[speciesNutrition]
AS 
	SELECT
		a1.species_name, a2.nutrition_id
		FROM tbl_species a1
		INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
		WHERE species_nutrition BETWEEN 2202 AND 2206;