--БЛОК 3 SQL 

--Задание 1: Абитуриенты
SELECT 
    id,
    scores,
    DENSE_RANK() OVER (ORDER BY scores DESC) as position
FROM examination
ORDER BY position;

--Задание 2: FULL JOIN
--Минимальное 30, максимальное 50 

--Задание 3: Покупки

SELECT 
    a.client_id
FROM account a
LEFT JOIN transaction t ON a.id = t.account_id 
    AND t.type = 'пок'
    AND t.transaction_date >= CURRENT_DATE - INTERVAL '1 month'
GROUP BY a.client_id
HAVING COALESCE(SUM(t.amount), 0) < 5000
