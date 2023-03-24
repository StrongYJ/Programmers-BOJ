-- 코드를 입력하세요
SELECT 
    A.AUTHOR_ID,
    B.AUTHOR_NAME,
    A.CATEGORY,
    A.TOTAL_SALES
FROM (
    SELECT 
    A.AUTHOR_ID,
    A.CATEGORY,
    SUM(A.PRICE * B.SALES) TOTAL_SALES
    FROM BOOK A
    JOIN (
        SELECT BOOK_ID, SUM(SALES) SALES
        FROM BOOK_SALES
        WHERE TO_CHAR(SALES_DATE, 'YYYYMM') = '202201'
        GROUP BY BOOK_ID
    ) B ON A.BOOK_ID = B.BOOK_ID
    GROUP BY AUTHOR_ID, A.CATEGORY
) A
JOIN AUTHOR B ON A.AUTHOR_ID = B.AUTHOR_ID
ORDER BY AUTHOR_ID, CATEGORY DESC;
