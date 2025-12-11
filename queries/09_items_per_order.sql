Last login: Fri Dec 12 00:00:39 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/09_items_per_order.sql





















/Users/hashitaharies/Ford_SQL_Project/queries/09_items_per_order.sql    Modified

SELECT
    order_id,
    SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id
ORDER BY order_id;














^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
