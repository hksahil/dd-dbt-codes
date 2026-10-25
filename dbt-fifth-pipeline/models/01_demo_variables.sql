{{ config(materialized='table') }}

-- ========================================================
-- TEACHING TOPIC: dbt Variables (`var`)
-- 1. Defined in dbt_project.yml under `vars:`
-- 2. Can have a fallback default: {{ var('variable_name', default_value) }}
-- 3. Can be overridden via CLI: dbt run --vars '{"discount_rate": 0.25}'
-- ========================================================

select
    id as order_id,
    amount as original_amount,
    {{ var('discount_rate') }} as applied_discount_rate,
    round(amount * (1 - {{ var('discount_rate') }}), 2) as final_amount,
    round(amount * {{ var('tax_rate', 0.05) }}, 2) as estimated_tax
from orders
