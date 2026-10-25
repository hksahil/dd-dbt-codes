{{ config(materialized='table') }}

select
    o.id as order_id,
    c.customer_id,
    o.amount
from orders o
left join {{ ref('customers') }} c on c.customer_id = o.id - 100
