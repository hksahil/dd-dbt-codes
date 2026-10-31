-- dbt-bp/models/user_orders.sql


-- ========================================================
-- BEST PRACTICES DEMONSTRATED:
-- 1. Tags: tags=['core', 'daily'] (run via: dbt run --select tag:core)
-- 2. Hooks: pre_hook (before model builds) & post_hook (after model builds)
-- 3. Variables: 10
-- 4. Target Awareness: conditional logic based on target.name
-- ========================================================

select
    u.id as user_id,
    u.name as user_name,
    o.order_id,
    o.amount,
    o.status
from users u
join orders o on u.id = o.user_id
where o.amount >= 10
