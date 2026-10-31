-- dbt-bp/models/user_orders.sql
{{
  config(
    materialized='view',
    tags='daily',
    pre_hook=
    [
      "CREATE TABLE IF NOT EXISTS dbt_audit_logs (event_type VARCHAR, model_name VARCHAR, logged_at TIMESTAMP);",
      "INSERT INTO dbt_audit_logs VALUES ('MODEL_START', '{{ this.name }}', current_timestamp);"
    ],
    post_hook=[
      "INSERT INTO dbt_audit_logs VALUES ('MODEL_END', '{{ this.name }}', current_timestamp);"
    ]
  )
}}

-- ========================================================
-- 1. Tags: tags=['core', 'daily'] (run via: dbt run --select tag:core)
-- 2. Hooks: pre_hook (before model builds) & post_hook (after model builds)
-- 3. Variables: {{ var('min_order_amount', 0) }}
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
where o.amount >= {{ var('min_order_amount', 0) }}
{% if target.name == 'dev' %}
    -- In dev environment, limit rows to speed up development
t 5
    {% endif %}
