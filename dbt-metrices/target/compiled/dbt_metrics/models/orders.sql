

-- ========================================================
-- Simple Orders Table for Semantic Layer Demo
-- ========================================================

select
    order_id,
    user_id,
    amount,
    status,
    order_date
from "dev"."main"."orders"