{{ config(materialized='table') }}

-- Upstream dependency: ref('int_customer_orders')
select
    user_id,
    user_name,
    count(order_id) as total_orders_placed,
    sum(amount) as lifetime_spend
from {{ ref('int_customer_orders') }}
group by user_id, user_name
