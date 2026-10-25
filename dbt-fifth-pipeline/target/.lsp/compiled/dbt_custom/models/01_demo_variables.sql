

-- ========================================================
-- TEACHING TOPIC: dbt Variables (`var`)
-- 1. Defined in dbt_project.yml under `vars:`
-- 2. Can have a fallback default: 
-- 3. Can be overridden via CLI: dbt run --vars '{"discount_rate": 0.25}'
-- ========================================================

select
    id as order_id,
    amount as original_amount,
    0.1 as applied_discount_rate,
    round(amount * (1 - 0.1), 2) as final_amount,
    round(amount * 0.05, 2) as estimated_tax
from orders