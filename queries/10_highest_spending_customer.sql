Last login: Fri Dec 12 00:01:13 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/10_highest_spending_customer.sql





















...hitaharies/Ford_SQL_Project/queries/10_highest_spending_customer.sql Modified

SELECT
    c.name,
    ROUND(SUM(o.total_amount), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;












^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
