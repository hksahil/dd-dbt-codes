



select
    -- 1. Example: Surrogate Primary Key (MD5 hash of natural keys)
    md5(cast(order_id as varchar) || '-' || cast(user_id as varchar)) as order_customer_surrogate_key,
    
    order_id,
    user_id,
    amount,
    status,
    order_date,

    -- 2. Clean business metrics
    amount * 1.05 as amount_with_tax
from "dev"."main"."orders"