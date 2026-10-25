

-- Upstream dependency: source('raw_duckdb', 'orders')
select
    order_id,
    customer_id as user_id,
    amount
from "dev"."main"."orders"