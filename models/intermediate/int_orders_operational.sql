
SELECT *, 
ROUND(((margin + shipping_fee - ship_cost -logcost)), 2) AS operational_margin,
ship.logcost,
ship.shipping_fee, 
ship.ship_cost

 FROM {{ ref('int_orders_margin') }} AS orders_margin

RIGHT JOIN {{ ref("stg_raw__ship") }} AS ship
USING (orders_id)

ORDER BY orders_id desc