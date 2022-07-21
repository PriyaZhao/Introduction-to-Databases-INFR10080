SELECT CAST(P.pcode AS INT), CAST(sum(D.qty) AS INT) Orders
FROM Details D JOIN Products P ON D.pcode = P.pcode
GROUP BY P.ptype, P.pcode
HAVING sum(D.qty) >= (SELECT 1.5 * sum(D1.qty)/(COUNT(DISTINCT(P1.pcode))+0.5)
                      FROM Details D1 JOIN Products P1 ON D1.pcode = P1.pcode
                      WHERE P.ptype = P1.ptype);


SELECT CAST(P.pcode AS INT), CAST(sum(D.qty) AS INT) Orders
FROM Details D JOIN Products P ON D.pcode = P.pcode
GROUP BY P.ptype, P.pcode
HAVING sum(D.qty) >= (SELECT 1.5 * sum(D1.qty)/ COUNT(DISTINCT(P1.pcode))
                      FROM Details D1 JOIN Products P1 ON D1.pcode = P1.pcode
                      WHERE P.ptype = P1.ptype and P.pcode <> P1.pcode);