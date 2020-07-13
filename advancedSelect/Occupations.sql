select min(doctor) d, min(professor) p, min(singer) s, min(actor) a
    from (
            SELECT 
                CASE WHEN Occupation = 'Doctor' THEN name END AS Doctor , 
                CASE WHEN Occupation = 'Professor' THEN name END AS Professor , 
                CASE WHEN Occupation = 'Singer' THEN name END AS Singer , 
                CASE WHEN Occupation = 'Actor' THEN name END AS Actor , 
                RANK() OVER (PARTITION BY Occupation order by name) AS row_rank 
              FROM Occupations 
        ) temp 
 group by row_rank
 order by row_rank;
