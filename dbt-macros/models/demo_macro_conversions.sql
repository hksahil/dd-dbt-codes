select
    o.order_id,
    {{ trim_and_upper('u.name') }} as customer_name_cleaned,
    {{ cents_to_dollars('o.amount', 2) }} as amount_dollars
from {{ source('raw_duckdb', 'orders') }} o
left join {{ source('raw_duckdb', 'users') }} u on o.user_id = u.id
