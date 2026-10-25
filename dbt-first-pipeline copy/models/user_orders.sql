{{ config(materialized='table') }}

select
    o.order_id,
    o.customer_id,
    u.customer_name,
    o.amount,
    o.order_status,
    o.order_date
from {{ ref('stg_orders') }} o
join {{ ref('stg_users') }} u on o.customer_id = u.customer_id
