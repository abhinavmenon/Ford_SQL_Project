Last login: Thu Dec 11 23:56:27 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/04_revenue_by_customer.sql





















...rs/hashitaharies/Ford_SQL_Project/queries/04_revenue_by_customer.sql Modified

SELECT
    c.customer_id,
    c.name,
    ROUND(SUM(o.total_amount), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY revenue DESC;












^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
