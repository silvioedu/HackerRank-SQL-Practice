select Name from STUDENTS where marks > 75 order by SUBSTR(Name, length(Name)-2,3), id asc;
