select city 
from station 
where city not in (select city 
                     from station 
                     where left(city,1) in ('a','i','u','e','o') and right(city,1) in ('a','i','u','e','o')) group by city

