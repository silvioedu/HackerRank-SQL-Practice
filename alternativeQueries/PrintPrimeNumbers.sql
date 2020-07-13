SELECT LISTAGG(x.l, '&') WITHIN GROUP (ORDER BY x.l) gr
FROM (SELECT 1 g
        , seq.l
        , CASE 
            WHEN seq.l = 1 THEN NULL
            WHEN seq.l IN (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31) THEN 0
            WHEN MOD(seq.l, 2) = 0 THEN NULL
            WHEN MOD(seq.l, 3) = 0 THEN NULL
            WHEN MOD(seq.l, 5) = 0 THEN NULL
            WHEN MOD(seq.l, 7) = 0 THEN NULL
            WHEN MOD(seq.l, 11) = 0 THEN NULL
            WHEN MOD(seq.l, 13) = 0 THEN NULL
            WHEN MOD(seq.l, 17) = 0 THEN NULL
            WHEN MOD(seq.l, 19) = 0 THEN NULL
            WHEN MOD(seq.l, 23) = 0 THEN NULL
            WHEN MOD(seq.l, 29) = 0 THEN NULL
            WHEN MOD(seq.l, 31) = 0 THEN NULL
            ELSE 0
        END p
      FROM (SELECT LEVEL l FROM DUAL connect by level <= 1000) seq) x
 WHERE x.p IS NOT NULL
 GROUP BY x.g;