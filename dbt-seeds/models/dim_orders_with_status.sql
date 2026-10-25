{{ config(materialized='table') }}

select
*
from orders o
left join {{ ref('country_codes') }} c
    on c.country_code = 'US'
