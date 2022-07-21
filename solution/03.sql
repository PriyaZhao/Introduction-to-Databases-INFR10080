SELECT CAST(C.custid AS INT), C.cname, CAST(max(O.odate) AS DATE) Odate
FROM Customers C JOIN Orders O ON C.custid = O.ocust
GROUP BY C.custid;