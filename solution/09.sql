SELECT CAST(C.aid AS INT) CUSTID, C.cname, CAST(count(C.diff)+1 AS INT) NUM_ORDERS
FROM (SELECT A.aid, min(B.bdt)-A.adt as diff, A.cname
    FROM (SELECT C.custid aid, C.cname, O.odate adt
            FROM Customers C JOIN Orders O ON C.custid = O.ocust
            WHERE C.custid IN (SELECT C1.custid
                            FROM Customers C1 JOIN Orders O1 ON C1.custid = O1.ocust
                            GROUP BY  C1.custid
                            HAVING COUNT(O1.odate) = COUNT(DISTINCT(O1.odate)) AND COUNT(O1.ordid) >= 10)) A
        JOIN  (SELECT C.custid bid, C.cname, O.odate bdt
            FROM Customers C JOIN Orders O ON C.custid = O.ocust
            WHERE C.custid IN (SELECT C1.custid 
                            FROM Customers C1 JOIN Orders O1 ON C1.custid = O1.ocust
                            GROUP BY  C1.custid
                            HAVING COUNT(O1.odate) = COUNT(DISTINCT(O1.odate)) AND COUNT(O1.ordid) >= 10)) B
        ON A.aid = B.bid
    WHERE A.adt < B.bdt
    GROUP BY A.aid, A.cname, A.adt) C
GROUP BY C.aid, C.cname
HAVING avg(C.diff) < 7;