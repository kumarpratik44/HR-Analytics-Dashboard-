CREATE DATABASE IBM_HR_ANALYTICS;
select * from Employee_Attrition;

--  Attrition Analysis Query
SELECT Attrition, COUNT(*) AS total
FROM Employee_Attrition
GROUP BY Attrition;

-- Attrition % by Department
SELECT Department,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS AttritionRate
FROM Employee_Attrition
GROUP BY Department;

--  Average Income vs Attrition
SELECT Attrition, AVG(MonthlyIncome) AS avg_income
FROM Employee_Attrition
GROUP BY Attrition;

-- Performance Rating vs Attrition Count
SELECT PerformanceRating, COUNT(*) AS total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM Employee_Attrition
GROUP BY PerformanceRating;

-- Overtime vs Attrition
SELECT OverTime, COUNT(*) AS total,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM Employee_Attrition
GROUP BY OverTime;
-- Overall Attrition Rate

SELECT COUNT(*) FROM Employee_Attrition;
SELECT COUNT(*) FROM Employee_Attrition WHERE Attrition = 'Yes';

-- Department-wise Salary Insight
SELECT Department, round(AVG(MonthlyIncome),2) 
FROM Employee_Attrition
group by Department;
