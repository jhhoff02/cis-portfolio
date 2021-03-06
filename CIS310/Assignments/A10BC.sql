--Jessica Hoffman
--A10BC Queries

EXEC dbo.A10BB

--4. What are the top 5 products in terms of sales (total quantity * price)?
SELECT TOP(5) P.PROD_SKU, P.PROD_DESCRIPT, F.LINE_QTY, F.LINE_PRICE, SUM(F.LINE_QTY*F.LINE_PRICE) AS "TOTAL SALE AMT"
FROM FACT_TABLE F INNER JOIN PRODUCT_DIM P ON P.PRODUCTID = F.PRODUCTID
GROUP BY P.PROD_SKU, P.PROD_DESCRIPT, F.LINE_QTY, F.LINE_PRICE
ORDER BY SUM(F.LINE_QTY*F.LINE_PRICE) DESC

--5. List the names of employees who have sold the most products in terms of amount of sales (total of quantity * price).
SELECT TOP(5) E.EMP_FNAME, E.EMP_LNAME, COUNT(F.LINE_QTY*F.LINE_PRICE) AS "TOTAL SALES", SUM(F.LINE_QTY*F.LINE_PRICE) AS "TOTAL SALE AMT"
FROM FACT_TABLE F INNER JOIN EMPLOYEE_DIM E ON E.EMPLOYEEID = F.EMPLOYEEID
GROUP BY E.EMP_FNAME, E.EMP_LNAME
ORDER BY COUNT(F.LINE_QTY*F.LINE_PRICE) DESC

--6. List the total amount of sales by customer city and brand name. 
SELECT C.CUST_CITY, P.BRAND_NAME, COUNT(F.LINE_QTY*F.LINE_PRICE) AS "TOTAL SALES", SUM(F.LINE_QTY*F.LINE_PRICE) AS "TOTAL SALE AMT"
FROM FACT_TABLE F INNER JOIN CUSTOMER_DIM C ON C.CUSTOMERID = F.CUSTOMERID
				  INNER JOIN PRODUCT_DIM P ON P.PRODUCTID = F.PRODUCTID
GROUP BY C.CUST_CITY, P.BRAND_NAME

--7. List the customer names of customers and the top 5 products each of these customers have bought.
SELECT C.CUST_FNAME, C.CUST_LNAME, P.PROD_SKU, P.PROD_DESCRIPT, SUM(F.LINE_QTY) AS "QUANTITY"
FROM FACT_TABLE F INNER JOIN CUSTOMER_DIM C ON C.CUSTOMERID = F.CUSTOMERID
                  INNER JOIN PRODUCT_DIM P ON P.PRODUCTID = F.PRODUCTID
WHERE EXISTS (SELECT TOP(5) C.CUST_FNAME, F.PRODUCTID, SUM(F.LINE_QTY) AS "QUANTITY"
				FROM FACT_TABLE F INNER JOIN CUSTOMER_DIM C ON C.CUSTOMERID = F.CUSTOMERID
				GROUP BY C.CUST_FNAME, F.PRODUCTID
				ORDER BY SUM(F.LINE_QTY) DESC)
GROUP BY C.CUST_FNAME, C.CUST_LNAME, P.PROD_SKU, P.PROD_DESCRIPT
ORDER BY C.CUST_LNAME,  SUM(F.LINE_QTY) DESC
