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

date_date,
orders_id,
products_id,
revenue,
quantity,
purchase_price,
quantity*purchase_price AS purchase_cost,
ROUND(revenue-(quantity*purchase_price),2) AS margin

FROM join_sub



