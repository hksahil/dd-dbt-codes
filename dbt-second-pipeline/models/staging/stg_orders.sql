-- Staging model: type casting, foreign key mapping, and tier classification
select
    id as order_id,
    id - 100 as user_id,
    cast(amount as double) as amount_usd,
    case
        when amount >= 100 then 'High Value'
        when amount >= 50 then 'Medium Value'
        else 'Low Value'
    end as order_tier
from orders
