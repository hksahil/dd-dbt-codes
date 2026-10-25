

-- Upstream dependency: ref('int_customer_orders')
select
    count(order_id) as total_orders,
    sum(amount) as total_revenue,
    round(avg(amount), 2) as average_order_value
from "dev"."main"."int_customer_orders"