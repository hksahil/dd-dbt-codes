

select
*
from orders o
left join "dev"."main"."country_codes" c
    on c.country_code = 'US'