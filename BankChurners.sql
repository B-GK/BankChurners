SELECT *
FROM bankchurners

SELECT COUNT(*)
FROM bankchurners

--Average age of Attrited customers
WITH Age_F AS 
	(SELECT ROUND(Avg(Customer_Age),2) AS avgage_F
	FROM BankChurners
	WHERE Attrition_Flag = 'Attrited Customer' AND Gender= 'F'),
Age_M AS 
	(SELECT ROUND(Avg(Customer_Age),2) AS avgage_M
	FROM BankChurners
	WHERE Attrition_Flag = 'Attrited Customer' AND Gender= 'M')
SELECT f.avgage_F, m.avgage_M
FROM Age_F  f, Age_M  m


--Average age of Existing customers
WITH Age_F AS
	(SELECT ROUND(Avg(Customer_Age),2) AS avgage_F
	FROM BankChurners
	WHERE Attrition_Flag = 'Existing Customer' AND Gender= 'F'),
Age_M AS
	(SELECT ROUND(Avg(Customer_Age),2) AS avgage_M
	FROM BankChurners
	WHERE Attrition_Flag = 'Existing Customer' AND Gender= 'M')
SELECT f.avgage_F, m.avgage_M
FROM Age_F  f, Age_M  m

--Age range of Attrited Customer
SELECT Age_Range, COUNT(*)
FROM(		 SELECT CASE WHEN Customer_Age < 20 THEN '0-20'
		     WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
			 WHEN Customer_Age BETWEEN 30 AND 40 THEN '30-40'
			 WHEN Customer_Age BETWEEN 40 AND 50 THEN '40-50'
			 WHEN Customer_Age BETWEEN 50 AND 60 THEN '50-60'
			 WHEN Customer_Age BETWEEN 60 AND 70 THEN '60-70'
			 WHEN Customer_Age BETWEEN 70 AND 80 THEN '70-80'
			 WHEN Customer_Age > 80 THEN 'Above 80'
			 END AS Age_Range
			 FROM BankChurners
			 WHERE Attrition_Flag = 'Attrited Customer') AS AgeGroups
GROUP BY Age_Range
ORDER BY Age_Range

--Gender distribution in Existing Customers
WITH Male_Existing AS
		(SELECT COUNT(Gender) as num_m
		FROM BankChurners
		WHERE Attrition_Flag = 'Existing Customer' AND GENDER = 'M'),
Female_Existing AS 
		(SELECT COUNT(Gender) as num_f
		FROM BankChurners
		WHERE Attrition_Flag = 'Existing Customer'AND GENDER = 'F' )

SELECT m.num_m, f.num_f
FROM Male_Existing as m, Female_Existing as f


--Gender Distribtuion in Attrited Customers 

WITH Male_Attrited AS
		(SELECT COUNT(Gender) as num_m
		FROM BankChurners
		WHERE Attrition_Flag = 'Attrited Customer' AND GENDER = 'M'),
Female_Attrited AS 
		(SELECT COUNT(Gender) as num_f
		FROM BankChurners
		WHERE Attrition_Flag = 'Attrited Customer'AND GENDER = 'F' )

SELECT m.num_m, f.num_f
FROM Male_Attrited as m, Female_Attrited as f

--Education level in Existing Customers 
SELECT Education_Level, Count(*) AS num_edu_Exist
FROM BankChurners
WHERE Attrition_Flag = 'Existing Customer'
GROUP BY Education_Level
ORDER BY Count(*)

--Education level in Attrited Customers 
SELECT Education_Level, Count(*) AS num_edu_Attrit
FROM BankChurners
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Education_Level
ORDER BY Count(*)

--Marital Status in Existing Customers 
SELECT Marital_Status, COUNT(*) as num_mar_Exist
FROM BankChurners
WHERE Attrition_Flag = 'Existing Customer'
GROUP BY Marital_Status
ORDER BY Count(*)

--Marital Status in Attrited Customers 
SELECT Marital_Status, COUNT(*) as num_mar_Attrit
FROM BankChurners
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Marital_Status
ORDER BY Count(*)

--Income Category in Existing Customers 
SELECT Income_Category, COUNT(*) as num_inc_Exist
FROM BankChurners
WHERE Attrition_Flag = 'Existing Customer'
GROUP BY Income_Category
ORDER BY Count(*)

--Income Category in Attrited Customers 
SELECT Income_Category, COUNT(*) as num_inc_Attrit
FROM BankChurners
WHERE Attrition_Flag =  'Attrited Customer'
GROUP BY Income_Category
ORDER BY Count(*)


--Card Category in Existing Customers
SELECT Card_Category, COUNT(*) as num_card_Exist
FROM BankChurners
WHERE Attrition_Flag = 'Existing Customer'
GROUP BY Card_Category
ORDER BY Count(*)

--Card Category in Attrited Customers 
SELECT Card_Category, COUNT(*) as num_card_Attrit
FROM BankChurners
WHERE Attrition_Flag = 'Attrited Customer'
GROUP BY Card_Category
ORDER BY Count(*)

--Inactive Months for Existing Customers
SELECT Months_Inactive_12_mon, COUNT(*)
From (SELECT  CASE WHEN Months_Inactive_12_mon = 0 THEN '0' 
			  WHEN Months_Inactive_12_mon = 1 THEN '1'	
			  WHEN Months_Inactive_12_mon = 2 THEN '2'
			  WHEN Months_Inactive_12_mon = 3 THEN '3'
			  WHEN Months_Inactive_12_mon = 4 THEN '4'
			  WHEN Months_Inactive_12_mon = 5 THEN '5' 
			  WHEN Months_Inactive_12_mon = 6 THEN '6' 
			  END AS Months_Inactive_12_mon
			  FROM BankChurners
			  WHERE Attrition_Flag = 'Existing Customer') AS month_inact
GROUP BY Months_Inactive_12_mon
ORDER BY Months_Inactive_12_mon

--Inactive Months for Attrited Customers
SELECT Months_Inactive_12_mon, COUNT(*)
From (SELECT  CASE WHEN Months_Inactive_12_mon = 0 THEN '0' 
			  WHEN Months_Inactive_12_mon = 1 THEN '1'	
			  WHEN Months_Inactive_12_mon = 2 THEN '2'
			  WHEN Months_Inactive_12_mon = 3 THEN '3'
			  WHEN Months_Inactive_12_mon = 4 THEN '4'
			  WHEN Months_Inactive_12_mon = 5 THEN '5' 
			  WHEN Months_Inactive_12_mon = 6 THEN '6' 
			  END AS Months_Inactive_12_mon
			  FROM BankChurners
			  WHERE Attrition_Flag = 'Attrited Customer') AS month_inact
GROUP BY Months_Inactive_12_mon
ORDER BY Months_Inactive_12_mon

--Average Utilization ratio for Existing Customers 
SELECT ROUND(AVG(Avg_Utilization_Ratio)*100,2) AS AvgUtilization, Attrition_Flag
FROM BankChurners
WHERE Attrition_Flag = 'Existing Customer' 
GROUP BY Attrition_Flag

--Average Utilization ratio for Attrited Customers 
SELECT ROUND(AVG(Avg_Utilization_Ratio)*100,2) AS AvgUtilization, Attrition_Flag
FROM BankChurners
WHERE Attrition_Flag = 'Attrited Customer' 
GROUP BY Attrition_Flag



