Last login: Fri Dec 12 00:00:09 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/08_order_list.sql






















File: /Users/hashitaharies/Ford_SQL_Project/queries/08_order_list.sql   Modified

SELECT
    o.order_id,
    c.name,
    o.order_date,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;












^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
