select city, length(city) from station where length(city) = (select max(length(city)) from station) 
union all 
(select city, len from (select city, Row_Number() OVER (ORDER BY city)  MyRow, length(CITY) len from station where length(city) = 
(select min(length(city)) from station)) where MyRow = 1);
