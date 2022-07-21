SELECT CAST(I.invid AS INT), CAST((sum(P.amount)-I.amount) AS NUMERIC) reimbursement
FROM Invoices I JOIN Payments P ON I.invid = P.invid
GROUP BY I.invid
HAVING I.amount < sum(P.amount);