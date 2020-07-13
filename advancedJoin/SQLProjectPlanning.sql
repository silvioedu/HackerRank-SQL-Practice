SELECT Start_Date, Fin FROM (
    SELECT a.Start_Date, Min(b.End_Date) As Fin
      FROM
        (
            SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
        ) a,
        (
            SELECT End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
        ) b
     WHERE Start_Date < End_Date
     GROUP BY a.Start_Date
    ) p
 ORDER BY DATEDIFF(Fin, Start_Date), Start_Date;
