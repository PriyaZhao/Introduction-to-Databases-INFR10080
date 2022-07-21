SELECT DISTINCT(CAST(O.ordid AS INT)), CAST(O.odate AS DATE), CAST(P.ptype AS VARCHAR) 
FROM Orders O JOIN Details D ON O.ordid = D.ordid JOIN Products P ON D.pcode = P.pcode 
WHERE O.ordid IN (SELECT O1.ordid
        FROM Orders O1 JOIN Details D1 ON O1.ordid = D1.ordid JOIN Products P1 ON D1.pcode = P1.pcode 
        GROUP BY O1.ordid
        HAVING COUNT(DISTINCT(P1.ptype)) = 1); 