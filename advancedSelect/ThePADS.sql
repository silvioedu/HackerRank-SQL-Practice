select name||'('||substr(occupation,1,1)||')' from occupations order by name;

select 'There are a total of '||X.occu_count||' '||lower(X.occupation)||'s.' from 
select occupation, count(occupation) as occu_count from occupations group by occupation)X order by X.occu_count, X.occupation;

