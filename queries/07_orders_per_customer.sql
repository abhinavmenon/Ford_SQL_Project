Last login: Thu Dec 11 23:58:34 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/07_orders_per_customer.sql





















...rs/hashitaharies/Ford_SQL_Project/queries/07_orders_per_customer.sql Modified

SELECT
    c.name,
    COUNT(o.order_id) AS number_of_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY number_of_orders DESC;













^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
