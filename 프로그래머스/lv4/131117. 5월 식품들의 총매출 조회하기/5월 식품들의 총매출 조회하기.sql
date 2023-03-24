-- 코드를 입력하세요
SELECT A.PRODUCT_ID, A.PRODUCT_NAME, (A.PRICE * B.TOTAL_AMOUNT) TOTAL_SALES
FROM FOOD_PRODUCT A
JOIN (
    SELECT PRODUCT_ID, SUM(AMOUNT) TOTAL_AMOUNT 
    FROM FOOD_ORDER 
    WHERE TO_CHAR(PRODUCE_DATE, 'YYYYMM') = '202205'
    GROUP BY PRODUCT_ID 
) B ON A.PRODUCT_ID = B.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, A.PRODUCT_ID;
