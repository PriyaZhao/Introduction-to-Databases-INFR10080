SELECT CAST(C.custid AS INT), CAST(sum(D.qty) AS INT) BOOKS
FROM Customers C JOIN Orders O ON C.custid = O.ocust JOIN Details D ON O.ordid = D.ordid 
JOIN Products P ON D.pcode = P.pcode 
WHERE P.ptype = 'BOOK'
GROUP BY C.custid
HAVING sum(D.qty) > (SELECT 2*SUM(D1.qty) 
                     FROM Customers C1 JOIN Orders O1 ON C1.custid = O1.ocust 
                     JOIN Details D1 ON O1.ordid = D1.ordid JOIN Products P1 ON D1.pcode = P1.pcode 
                     WHERE C.custid = C1.custid AND P1.ptype <> 'BOOK');    