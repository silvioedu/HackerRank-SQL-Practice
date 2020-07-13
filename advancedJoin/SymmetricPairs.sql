select distinct f1.x, f1.y   
  from 
  (select x, y,row_number() over (partition by x, y order by x) as cnt from Functions) f1
    join Functions f2 
        on f1.x = f2.y 
        and f1.y = f2.x 
        and (f1.x != f1.y 
             or cnt > 1)
        and f1.x <= f1.y                                  
order by f1.x;
