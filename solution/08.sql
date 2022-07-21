SELECT CAST(F.id AS INT) Custid, CAST(max(F.near_dt) AS INT) NUM_DAYS
FROM (SELECT A.id as id, A.dt, min(A.dt-B.dt) as near_dt
        FROM (SELECT C.custid id, O.odate dt FROM Customers C JOIN Orders O ON C.custid = O.ocust) AS A JOIN
            (SELECT C.custid id, O.odate dt FROM Customers C JOIN Orders O ON C.custid = O.ocust) AS B ON A.id = B.id
        WHERE A.dt > B.dt 
        GROUP BY A.id, A.dt) AS F
GROUP BY F.id;