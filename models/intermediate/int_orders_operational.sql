WITH sub_ope AS (

SELECT *, 
ship.logcost AS logicost, 
ship.shipping_fee AS shipping_fi, 
CAST (ship.ship_cost AS FLOAT64) AS ship_kost

 FROM {{ ref('int_orders_margin') }} AS orders_margin

RIGHT JOIN {{ ref("stg_raw__ship") }} AS ship
USING (orders_id)) 

SELECT 

orders_id, 
date_date, 
SUM(quantity) AS quantity,
ROUND((margin)+(sub_ope.shipping_fi)-(ship_kost)-(logicost),2) AS operational_margin

FROM sub_ope

GROUP BY orders_id, date_date

HAVING orders_id=1002560




