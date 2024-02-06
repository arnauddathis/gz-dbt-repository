WITH join_sub AS (

SELECT 
sales.date_date,
sales.orders_id,
sales.products_id,
sales.revenue,
sales.quantity, 
CAST (products.purchase_price AS FLOAT64) AS purchase_price

FROM {{ ref('stg_raw__sales') }} AS sales

LEFT JOIN {{ ref('stg_raw__product') }} AS products

USING (products_id))


SELECT 

orders_id,
date_date,
ROUND(SUM(revenue),2) AS revenue,
SUM(quantity) AS quantity,
ROUND(SUM((quantity)*(purchase_price)),2) AS purchase_cost,
ROUND(SUM((revenue-(quantity*purchase_price))),2) AS margin

FROM join_sub

GROUP BY orders_id, date_date

HAVING orders_id=1002561



