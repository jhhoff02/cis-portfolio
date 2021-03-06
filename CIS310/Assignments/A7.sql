--Jessica Hoffman
--A7,Ch 7 p. 65-95

--65
SELECT BOOK_TITLE, BOOK_COST, BOOK_YEAR
FROM BOOK

--66
SELECT PAT_FNAME, PAT_LNAME
FROM PATRON

--67
SELECT CHECK_NUM, CHECK_OUT_DATE, CHECK_DUE_DATE
FROM CHECKOUT

--68
SELECT BOOK_NUM, BOOK_TITLE, BOOK_YEAR
FROM BOOK

--69
SELECT DISTINCT BOOK_YEAR
FROM BOOK

--70
SELECT DISTINCT BOOK_SUBJECT
FROM BOOK

--71
SELECT BOOK_NUM, BOOK_TITLE, BOOK_COST
FROM BOOK

--72
SELECT C.CHECK_NUM, B.BOOK_NUM, P.PAT_ID, C.CHECK_OUT_DATE, C.CHECK_DUE_DATE
FROM CHECKOUT C INNER JOIN BOOK B ON C.BOOK_NUM = B.BOOK_NUM INNER JOIN PATRON P ON C.PAT_ID = P.PAT_ID
ORDER BY C.CHECK_OUT_DATE DESC

--73
SELECT BOOK_TITLE, BOOK_YEAR, BOOK_SUBJECT
FROM BOOK
ORDER BY BOOK_SUBJECT ASC, BOOK_YEAR DESC, BOOK_TITLE ASC

--74
SELECT BOOK_NUM, BOOK_TITLE, BOOK_YEAR
FROM BOOK
WHERE BOOK_YEAR = 2012

--75
SELECT BOOK_NUM, BOOK_TITLE, BOOK_YEAR
FROM BOOK
WHERE BOOK_SUBJECT = 'Database'

--76
SELECT C.CHECK_NUM, B.BOOK_NUM, C.CHECK_OUT_DATE
FROM CHECKOUT C INNER JOIN BOOK B ON C.BOOK_NUM = B.BOOK_NUM
WHERE C.CHECK_OUT_DATE < '2015-04-05'

--77
SELECT BOOK_NUM, BOOK_TITLE, BOOK_YEAR
FROM BOOK
WHERE BOOK_YEAR > 2013 AND BOOK_SUBJECT = 'Programming'

--78
SELECT BOOK_NUM, BOOK_TITLE, BOOK_YEAR, BOOK_SUBJECT, BOOK_COST
FROM BOOK
WHERE BOOK_SUBJECT IN (SELECT BOOK_SUBJECT
					   FROM BOOK
					   WHERE BOOK_SUBJECT ='Middleware' OR BOOK_SUBJECT = 'Cloud')
AND BOOK_COST > 70

--79
SELECT AU_ID, AU_FNAME, AU_LNAME, AU_BIRTHYEAR
FROM AUTHOR
WHERE AU_BIRTHYEAR IN (SELECT AU_BIRTHYEAR
					   FROM AUTHOR
					   WHERE AU_BIRTHYEAR < 1990 AND AU_BIRTHYEAR > 1979)

--80
SELECT BOOK_NUM, BOOK_TITLE, BOOK_YEAR
FROM BOOK
WHERE UPPER(BOOK_TITLE) LIKE '%DATABASE%'

--81
SELECT PAT_ID, PAT_FNAME, PAT_LNAME
FROM PATRON
WHERE PAT_TYPE = 'Student'

--82
SELECT PAT_ID, PAT_FNAME, PAT_LNAME, PAT_TYPE
FROM PATRON
WHERE PAT_LNAME LIKE 'C%'

--83
SELECT AU_ID, AU_FNAME, AU_LNAME
FROM AUTHOR
WHERE AU_BIRTHYEAR IS NULL

--84
SELECT AU_ID, AU_FNAME, AU_LNAME
FROM AUTHOR
WHERE AU_BIRTHYEAR IS NOT NULL

--85
SELECT CHECK_NUM, BOOK_NUM, PAT_ID, CHECK_OUT_DATE, CHECK_DUE_DATE
FROM CHECKOUT
WHERE CHECK_IN_DATE IS NULL
ORDER BY BOOK_NUM

--86
SELECT AU_ID, AU_FNAME, AU_LNAME, AU_BIRTHYEAR
FROM AUTHOR
ORDER BY AU_BIRTHYEAR DESC, AU_LNAME ASC

--87
SELECT COUNT(*) AS 'Number of Books'
FROM BOOK

--88
SELECT COUNT(DISTINCT BOOK_SUBJECT) AS 'Number of Subjects'
FROM BOOK

--89
SELECT COUNT(*) AS 'Available Books'
FROM BOOK
WHERE PAT_ID IS NULL

--90
SELECT MAX(BOOK_COST) AS 'Most Expensive'
FROM BOOK

--91
SELECT MIN(BOOK_COST) AS 'Least Expensive'
FROM BOOK

--92
SELECT COUNT(DISTINCT PAT_ID) AS 'DIFFERENT PATRONS'
FROM CHECKOUT

--93
SELECT BOOK_SUBJECT, COUNT(DISTINCT BOOK_NUM) AS 'Books In Subject'
FROM BOOK
GROUP BY BOOK_SUBJECT
ORDER BY COUNT(DISTINCT BOOK_NUM) DESC, BOOK_SUBJECT ASC

--94
SELECT AU_ID, COUNT(DISTINCT BOOK_NUM) AS 'Books Written'
FROM WRITES
GROUP BY AU_ID
ORDER BY COUNT(DISTINCT BOOK_NUM) DESC, AU_ID ASC

--95
SELECT SUM(BOOK_COST) AS 'Library Value'
FROM BOOK