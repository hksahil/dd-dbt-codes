

select
    o.id as order_id,
    o.amount,
    c.country_name,
    c.continent
from orders o
left join "dev"."main"."country_codes" c
    on c.country_code = 'US'