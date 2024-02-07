WITH sub_ope AS (

SELECT *, 
ship.logcost AS logicost, 
ship.shipping_fee AS shipping_fi, 
ship.ship_cost AS ship_kost

 FROM {{ ref('int_orders_margin') }} AS orders_margin

RIGHT JOIN {{ ref("stg_raw__ship") }} AS ship
USING (orders_id)) 

SELECT 

orders_id, 
date_date, 
ROUND(SUM((margin + shipping_fi - ship_kost -logicost)), 2) AS operational_margin, 
ROUND(SUM(revenue),2) AS revenue, 
ROUND(SUM(margin), 2) AS margin,
ROUND(SUM(quantity),2) AS quantity
FROM sub_ope

GROUP BY orders_id, date_date







