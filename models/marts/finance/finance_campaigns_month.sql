SELECT

CONCAT(EXTRACT(MONTH FROM date_date), ' - ', EXTRACT(YEAR FROM date_date)) AS monthdate,
ROUND(SUM(ads_margin),2) AS ads_margin, 
ROUND(SUM(average_basket),2) AS average_basket, 
ROUND(SUM(operational_margin),2) AS operational_margin, 
ROUND(SUM(average_basket_bis),2) AS average_basket_bis, 
ROUND(SUM(quantity),2) AS quantity, 
ROUND(SUM(nb_transactions),2) AS nb_transactions

FROM {{ref('finance_campaigns_day')}}

GROUP BY CONCAT(EXTRACT(MONTH FROM date_date), ' - ', EXTRACT(YEAR FROM date_date))
