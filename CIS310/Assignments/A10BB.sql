--Jessica Hoffman
--A10BB Stored Procedure

CREATE PROCEDURE A10BB

AS
BEGIN

SET NOCOUNT ON;

--Drop Constraints
ALTER TABLE FACT_TABLE DROP CONSTRAINT FK_CUSTOMER
ALTER TABLE FACT_TABLE DROP CONSTRAINT FK_EMPLOYEE
ALTER TABLE FACT_TABLE DROP CONSTRAINT FK_PRODUCT
ALTER TABLE FACT_TABLE DROP CONSTRAINT FK_TIME

--Truncate Tables
TRUNCATE TABLE FACT_TABLE
TRUNCATE TABLE CUSTOMER_DIM
TRUNCATE TABLE EMPLOYEE_DIM
TRUNCATE TABLE PRODUCT_DIM
TRUNCATE TABLE TIME_DIM

--Add Constraints
ALTER TABLE FACT_TABLE
ADD CONSTRAINT FK_PRODUCT FOREIGN KEY (PRODUCTID) REFERENCES PRODUCT_DIM,
	CONSTRAINT FK_CUSTOMER FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER_DIM,
	CONSTRAINT FK_EMPLOYEE FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE_DIM,
	CONSTRAINT FK_TIME FOREIGN KEY (TIMEID) REFERENCES TIME_DIM

--Insert Data

--Populate Dimension tables
INSERT INTO CUSTOMER_DIM
SELECT CUST_CODE, CUST_LNAME, CUST_FNAME, CUST_STREET, CUST_CITY, CUST_STATE, CUST_ZIP
FROM   LGCUSTOMER

INSERT INTO EMPLOYEE_DIM
SELECT E.EMP_NUM, E.EMP_FNAME, E.EMP_LNAME, E.EMP_TITLE, E.DEPT_NUM, D.DEPT_NAME
FROM   LGEMPLOYEE E INNER JOIN LGDEPARTMENT D ON E.DEPT_NUM = D.DEPT_NUM

INSERT INTO PRODUCT_DIM
SELECT P.PROD_SKU, P.PROD_DESCRIPT, P.PROD_TYPE, P.BRAND_ID, B.BRAND_NAME, B.BRAND_TYPE
FROM   LGPRODUCT P INNER JOIN LGBRAND B ON B.BRAND_ID = P.BRAND_ID

INSERT INTO TIME_DIM (INV_DATE, YEAR_NUM, MONTH_NUM, QUARTER_NUM)
SELECT DISTINCT INV_DATE, YEAR(INV_DATE), MONTH(INV_DATE), DATEPART(QUARTER, INV_DATE)
FROM LGINVOICE

--Create Staging table
CREATE TABLE STAGING
(
PRODUCTID	INT,
CUSTOMERID	INT,
EMPLOYEEID	INT,
TIMEID		INT,
PROD_SKU	VARCHAR(15),
EMP_NUM		NUMERIC(6,0),
CUST_CODE	NUMERIC(38,0),
INV_DATE	DATE,
LINE_QTY	NUMERIC(18,0),
LINE_PRICE	NUMERIC(8,2),
INV_TOTAL	NUMERIC(11,2)
)

--Populate Staging table
INSERT INTO STAGING (PROD_SKU, EMP_NUM, CUST_CODE, INV_DATE, LINE_QTY, LINE_PRICE, INV_TOTAL)
SELECT	    P.PROD_SKU, E.EMP_NUM, C.CUST_CODE, I.INV_DATE, L.LINE_QTY, L.LINE_PRICE, I.INV_TOTAL
FROM		LGINVOICE I INNER JOIN LGEMPLOYEE E ON I.EMPLOYEE_ID = E.EMP_NUM
						INNER JOIN LGCUSTOMER C ON C.CUST_CODE = I.CUST_CODE
						INNER JOIN LGLINE L ON L.INV_NUM = I.INV_NUM
						INNER JOIN LGPRODUCT P ON P.PROD_SKU = L.PROD_SKU

UPDATE STAGING
SET	   PRODUCTID = P.PRODUCTID
FROM   STAGING S INNER JOIN PRODUCT_DIM P ON S.PROD_SKU = P.PROD_SKU

UPDATE STAGING
SET    CUSTOMERID = C.CUSTOMERID
FROM   STAGING S INNER JOIN CUSTOMER_DIM C ON S.CUST_CODE = C.CUST_CODE

UPDATE STAGING
SET    EMPLOYEEID = E.EMPLOYEEID
FROM   STAGING S INNER JOIN EMPLOYEE_DIM E ON S.EMP_NUM = E.EMP_NUM

UPDATE STAGING
SET    TIMEID = T.TIMEID
FROM   STAGING S INNER JOIN TIME_DIM T ON S.INV_DATE = T.INV_DATE

--Populate Fact table
INSERT INTO FACT_TABLE
SELECT DISTINCT PRODUCTID, CUSTOMERID, EMPLOYEEID, TIMEID, SUM(LINE_QTY), AVG(LINE_PRICE)
FROM        STAGING
GROUP BY    PRODUCTID, CUSTOMERID, EMPLOYEEID, TIMEID

--Drop Staging table
DROP TABLE STAGING

END
GO