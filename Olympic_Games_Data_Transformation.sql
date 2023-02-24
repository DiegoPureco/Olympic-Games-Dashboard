--Before loading the data to Power BI, I made some transformations using SQL

SELECT  ID,
		Name as 'Competitor Name', --Rename Column
		CASE WHEN Sex = 'M' THEN 'Male' ELSE 'Femele' END AS Sex, -- Better name for later filters and visualizations
		Age,
		CASE WHEN Age < 18 THEN 'Under 18' -- Age grouping
			 WHEN Age BETWEEN 18 AND 25 THEN '18-25'
			 WHEN Age BETWEEN 26 AND 30 THEN '26-30'
			 WHEN Age > 30 THEN 'Over 30'
			 END AS 'Age Grouping',
		Height,
		Weight,
		NOC AS 'Country Code',-- Better name
		LEFT(Games, 4) AS 'Year', -- I split the games column into two columns: 'Year' and 'Season'
		RIGHT(Games, 6) AS 'Season', --since the lenght of "Winter" and "Summer" is 6 characters, I use Right(Games, 6) to determine the season
		City,
		Sport,
		Event, 
		CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal
FROM athletes_event_results
WHERE RIGHT(Games, 6) = 'Summer' --WHERE Clause to filter only Summer Season