

-- ========================================================
-- TEACHING TOPIC: Jinja Control Flow (If / Else & For Loops)
-- 1. If/Else: Conditional SQL based on environment or variables
-- 2. For Loop: Dynamic SQL generation (e.g. Pivoting columns)
-- 3. Loop controls: `loop.last` prevents trailing commas
-- ========================================================



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
    
        'Discounts Enabled' as promo_status,
    

    count(*) as total_orders,

    -- 2. FOR LOOP Example: Dynamically generate pivot columns without manual repetition
    
    sum(case when tier = 'small' then amount else 0 end) as total_small_amount,
    
    sum(case when tier = 'medium' then amount else 0 end) as total_medium_amount,
    
    sum(case when tier = 'large' then amount else 0 end) as total_large_amount
    

from classified_orders

-- 3. IF/ELSE Example in WHERE/LIMIT clause (e.g., limit rows only in dev environment)

-- Dev mode limit: only top records processed
