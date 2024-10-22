SELECT p.PRODUCT_ID, p.PRODUCT_NAME, SUM(o.AMOUNT) * p.PRICE AS TOTAL_SALES
FROM (
    SELECT *
    FROM FOOD_ORDER
    WHERE DATE_FORMAT(PRODUCE_DATE, '%Y-%m') = '2022-05'
    ) o
    INNER JOIN FOOD_PRODUCT p
    ON o.PRODUCT_ID = p.PRODUCT_ID
GROUP BY o.PRODUCT_ID
ORDER BY TOTAL_SALES DESC,
    p.PRODUCT_ID ASC;