SELECT CAST(P.pcode AS INT), CAST(P.price AS NUMERIC)
FROM Products P JOIN Details D ON P.pcode = D.pcode
GROUP BY P.pcode
HAVING AVG(D.qty) >= 3;