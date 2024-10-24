WITH COUNT_USERS AS (
    SELECT COUNT(*) AS 'COUNT'
    FROM USER_INFO
    WHERE YEAR(JOINED) = 2021
)
SELECT YEAR(s.SALES_DATE) AS YEAR, 
    MONTH(s.SALES_DATE) AS MONTH,
    COUNT(DISTINCT i.USER_ID) AS PURCHASED_USERS,
    ROUND(COUNT(DISTINCT i.USER_ID) / `COUNT`, 1) AS PURCHASED_RATIO
FROM USER_INFO i
    INNER JOIN ONLINE_SALE s
    ON i.USER_ID = s.USER_ID
    CROSS JOIN COUNT_USERS c
WHERE YEAR(i.JOINED) = 2021
GROUP BY YEAR(s.SALES_DATE), MONTH(s.SALES_DATE)
ORDER BY YEAR(s.SALES_DATE), MONTH(s.SALES_DATE);