--Lesson 10 – Aggregations (COUNT, SUM, AVG, GROUP BY)
 
--SECTION 1 – COUNT Aggregations (10 Questions)
--1. How many total properties are in the database?
select count(*) as Total_number_of_properties
from [property24].[dbo].[property24_v1];

--2. How many properties are listed in each province?
select province, count(*) as Number_of_properties_in_each_province
from [property24].[dbo].[property24_v1]
group by province;

--3. How many properties are listed in each city?
select city, count(*) as Number_of_properties_in_each_city
from [property24].[dbo].[property24_v1]
group by city;

--4. How many properties have more than 2 bedrooms?
select count(*) as Number_of_properties_with_more_than_2_bedrooms
from [property24].[dbo].[property24_v1]
where bedrooms >2;

--5. How many properties have 2 or more bathrooms?
select count(*) as Number_of_properties_with_at_least_2_bedrooms
from [property24].[dbo].[property24_v1]
where bedrooms >=2;

--6. How many properties have parking for at least 2 cars?
select count(*) as Number_of_properties_with_at_least_2_parking_lot
from [property24].[dbo].[property24_v1]
where parking >=2;

--7. How many properties are priced above R3,000,000?
select count(*) as Number_properties
from [property24].[dbo].[property24_v1]
where property_price > 3000000;

--8. How many properties are in Gauteng?
select count(*) as Number_of_properties
from [property24].[dbo].[property24_v1]
where province = 'gauteng'

--9. How many properties per province have floor size greater than 200?
select province, count(*) Number_of_properties_per_province
from [property24].[dbo].[property24_v1]
where floor_size > 200
group by province

--10. How many distinct provinces are in the table?
select count(distinct province) as distinct_provinces
from [property24].[dbo].[property24_v1]

--SECTION 2 – SUM Aggregations (10 Questions)


--11. What is the total value of all properties combined?
select sum(cast(property_price as BIGINT)) as Total_Properties_Value
from [property24].[dbo].[property24_v1]

--12. What is the total property value per province?
select province, sum(cast(property_price as BIGINT)) as Total_Properties_Value
from [property24].[dbo].[property24_v1]
group by province

--13. What is the total property value per city?
select city, sum(cast(property_price as BIGINT)) as Total_Properties_Value
from [property24].[dbo].[property24_v1]
group by city

--14. What is the total monthly repayment for all properties?
select sum(cast(monthly_repayment as BIGINT)) as Total_Monthly_Repayment
from [property24].[dbo].[property24_v1]

--15. What is the total monthly repayment per province?
select province, sum(cast(monthly_repayment as BIGINT)) as Total_Monthly_Repayment
from [property24].[dbo].[property24_v1]
group by province
order by Total_Monthly_Repayment desc;

--16. What is the total once-off cost for all properties?
select sum(cast(total_once_off_costs as BIGINT)) as Total_Once_Off_Costs
from [property24].[dbo].[property24_v1]

--17. What is the total once-off cost per province?
select province, sum(cast(total_once_off_costs as BIGINT)) as Total_Once_Off_Costs
from [property24].[dbo].[property24_v1]
group by province

--18. What is the total property value for Gauteng?
select sum(cast(property_price as BIGINT)) as Total_Properties_Value
from [property24].[dbo].[property24_v1]
where province ='gauteng'

--19. What is the total property value for properties priced above R4,000,000?
select sum(cast(property_price as BIGINT)) as Total_Properties_Value
from [property24].[dbo].[property24_v1]
where property_price > 4000000

--20. What is the total minimum gross monthly income required per province?
select province, sum(cast(min_gross_monthly_income as BIGINT)) as Total_Minimum_Gross_Monthly_Income
from [property24].[dbo].[property24_v1]
group by province

--SECTION 3 – AVG Aggregations (10 Questions)
--21. What is the average property price overall?
select avg(cast(property_price as BIGINT)) as Average_Property_price
from [property24].[dbo].[property24_v1]

--22. What is the average property price per province?
select province, avg(cast(property_price as BIGINT)) as Average_Property_price
from [property24].[dbo].[property24_v1]
group by province

--23. What is the average property price per city?
select city, avg(cast(property_price as BIGINT)) as Average_Property_price
from [property24].[dbo].[property24_v1]
group by city

--24. What is the average number of bedrooms per province?
select province, avg(cast(bedrooms as BIGINT)) as Average_Number_Bedrooms
from [property24].[dbo].[property24_v1]
group by province

--25. What is the average number of bathrooms per province?
select province, avg(cast(bathrooms as BIGINT)) as Average_Number_Bathrooms
from [property24].[dbo].[property24_v1]
group by province

--26. What is the average floor size per province?
select province, avg(cast(floor_size as BIGINT)) as Average_Floor_Size
from [property24].[dbo].[property24_v1]
group by province

--27. What is the average monthly repayment per province?
select province, avg(Monthly_Repayment) as Average_Monthly_Repayment
from [property24].[dbo].[property24_v1]
group by province

--28. What is the average once-off cost per province?
select province, avg(cast(Total_Once_off_Costs as BIGINT)) as Average_Once_Off_Costs
from [property24].[dbo].[property24_v1]
group by province

--29. What is the average minimum gross monthly income per province?
select province, avg(Min_Gross_Monthly_Income) as Average_Minimum_Gross_Monthly_Income
from [property24].[dbo].[property24_v1]
group by province

--30. What is the average property price for properties above R3,000,000?
select avg(cast(PROPERTY_PRICE as bigint)) as Average_Propery_Price
from [property24].[dbo].[property24_v1]
where PROPERTY_PRICE >3000000

--SECTION 4 – GROUP BY + Filtering (10 Questions)
--31. Which province has the highest average property price?
select top 1 province, avg(cast(property_price as BIGINT)) as Average_Property_Price
from [property24].[dbo].[property24_v1]
group by province 
order by Average_Property_Price desc

--32. Which province has the lowest average property price?
select top 1 province, avg(cast(property_price as BIGINT)) as Average_Property_Price
from [property24].[dbo].[property24_v1]
group by province 
order by Average_Property_Price asc

--33. Which city has the highest total property value?
select top 1 city, sum(cast(property_price as BIGINT)) as Total_Property_Value
from [property24].[dbo].[property24_v1]
group by city 
order by Total_Property_Value desc

--34. Which city has the lowest average property price?
select top 1 city, avg(cast(PROPERTY_PRICE as BIGINT)) as Average_Property_Price
from [property24].[dbo].[property24_v1]
group by city 
order by Average_Property_Price asc

--35. How many properties per province are priced above R2,000,000?
select province, count(*) as Number_Properties
from [property24].[dbo].[property24_v1]
where property_price > 2000000
group by province

--36. What is the average floor size per province for properties above R3,000,000?
select province, avg(floor_size) as Average_Floor_Size
from [property24].[dbo].[property24_v1]
where property_price > 3000000
group by province

--37. What is the total property value per province for properties with 3 or more bedrooms?
select province, sum(cast(property_price as BIGINT)) as Total_Property_Value
from [property24].[dbo].[property24_v1]
where BEDROOMS >= 3
group by province

--38. What is the average monthly repayment per province for properties above R4,000,000?
select province, avg(Monthly_Repayment) as Average_Monthly_Repayment
from [property24].[dbo].[property24_v1]
where property_price > 4000000
group by province

--39. How many properties per city have parking for 2 or more cars?
select city, count(*) as Number_Properties
from [property24].[dbo].[property24_v1]
where parking >= 2
group by city

--40. What is the average minimum gross monthly income per province for properties above R5,000,000?
select province, avg(Min_Gross_Monthly_Income) as Average_Minimum_Gross_Monthly_Income
from [property24].[dbo].[property24_v1]
where property_price > 5000000
group by province
