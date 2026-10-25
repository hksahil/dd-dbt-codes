{{ config(materialized='table') }}

-- ========================================================
-- TEACHING TOPIC: Jinja Control Flow (If / Else & For Loops)
-- 1. If/Else: Conditional SQL based on environment or variables
-- 2. For Loop: Dynamic SQL generation (e.g. Pivoting columns)
-- 3. Loop controls: `loop.last` prevents trailing commas
-- ========================================================

{% set order_tiers = ['small', 'medium', 'large'] %}

with classified_orders as (
    select
        id as order_id,
        amount,
        case
            when amount < 60 then 'small'
            when amount <= 100 then 'medium'
            else 'large'
        end as tier
    from orders
)

select
    -- 1. IF/ELSE Example: Conditionally include column or logic based on variable
    {% if var('enable_discount', false) %}
        'Discounts Enabled' as promo_status,
    {% else %}
        'No Discount' as promo_status,
    {% endif %}

    count(*) as total_orders,

    -- 2. FOR LOOP Example: Dynamically generate pivot columns without manual repetition
    {% for tier in order_tiers %}
    sum(case when tier = '{{ tier }}' then amount else 0 end) as total_{{ tier }}_amount
    {%- if not loop.last %},{% endif %}
    {% endfor %}

from classified_orders

-- 3. IF/ELSE Example in WHERE/LIMIT clause (e.g., limit rows only in dev environment)
{% if target.name == 'dev' %}
-- Dev mode limit: only top records processed
{% endif %}
