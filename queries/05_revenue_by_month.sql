Last login: Thu Dec 11 23:56:47 on ttys000
hashitaharies@MacBookPro ~ % nano ~/Ford_SQL_Project/queries/05_revenue_by_month.sql





















/Users/hashitaharies/Ford_SQL_Project/queries/05_revenue_by_month.sql   Modified

SELECT
    substr(order_date, 1, 7) AS month,
    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
GROUP BY month
ORDER BY month;














^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Pg   ^K Cut Text  ^C Cur Pos   
^X Exit      ^J Justify   ^W Where is  ^V Next Pg   ^U UnCut Text^T To Spell  
