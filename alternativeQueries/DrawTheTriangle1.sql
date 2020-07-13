select rpad('*',(41-2*level),' *') from dual connect by level <=20;
