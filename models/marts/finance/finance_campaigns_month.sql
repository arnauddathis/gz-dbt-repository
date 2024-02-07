select

    concat(
        extract(month from date_date), ' - ', extract(year from date_date)
    ) as monthdate,
    round(sum(ads_margin), 2) as ads_margin,
    round(sum(average_basket), 2) as average_basket,
    round(sum(operational_margin), 2) as operational_margin,
    round(sum(average_basket_bis), 2) as average_basket_bis,
    round(sum(quantity), 2) as quantity,
    round(sum(nb_transactions), 2) as nb_transactions

from {{ ref("finance_campaigns_day") }}

group by concat(extract(month from date_date), ' - ', extract(year from date_date))
