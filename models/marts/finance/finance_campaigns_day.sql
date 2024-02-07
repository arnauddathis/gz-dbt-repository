SELECT
date_date, 
ROUND(operational_margin-camp.ads_cost, 2) AS ads_margin, 
fin.average_basket, 
operational_margin, 
average_basket_bis, 
quantity, 
nb_transactions

FROM {{ref('finance_days')}} AS fin

LEFT JOIN {{ref('int_campaigns_day')}} AS camp

USING (date_date)
