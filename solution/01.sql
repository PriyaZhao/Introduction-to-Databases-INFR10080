SELECT CAST(C.country AS CHAR(3)), CAST(COUNT(O.ordid) AS INT) Orders
FROM Orders O JOIN Customers C ON O.ocust = C.custid
WHERE O.odate BETWEEN '2017-01-01' and '2020-12-31'
GROUP BY C.country
UNION
SELECT CAST(C.country AS CHAR(3)), CAST(0 AS INT)
FROM Customers C
WHERE C.custid NOT IN (SELECT Distinct(O.ocust) FROM Orders O WHERE O.odate BETWEEN '2017-01-01' and '2020-12-31');