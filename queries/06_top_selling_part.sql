Last login: Thu Dec 11 23:58:24 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/06_top_selling_part.sql





















/Users/hashitaharies/Ford_SQL_Project/queries/06_top_selling_part.sql   Modified

SELECT
    part_name,
    SUM(quantity) AS units_sold
FROM order_items
GROUP BY part_name
ORDER BY units_sold DESC
LIMIT 1;













^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
