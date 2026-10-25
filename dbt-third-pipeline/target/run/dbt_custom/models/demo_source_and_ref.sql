
  
  create view "dev"."main"."demo_source_and_ref__dbt_tmp" as (
    



with raw_users as (
    -- Accessing raw source data
    select
        id as user_id,
        name as user_name
    from "dev"."main"."users"
),

staged_orders as (
    -- Accessing a dbt model
    select
        order_id,
        user_id,
        amount
    from "dev"."main"."demo_incremental"
)

select
    u.user_id,
    u.user_name,
    o.order_id,
    o.amount,
    case
        when o.amount >= 100 then 'VIP Tier'
        else 'Standard Tier'
    end as user_tier
from raw_users u
join staged_orders o
    on u.user_id = o.user_id
  );
