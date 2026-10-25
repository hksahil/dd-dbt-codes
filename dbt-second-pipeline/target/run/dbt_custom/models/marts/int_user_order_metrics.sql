
  
  create view "dev"."main"."int_user_order_metrics__dbt_tmp" as (
    -- Intermediate model: user-level metrics & aggregations using dbt ref()
select
    u.user_id,
    u.user_name,
    count(o.order_id) as total_orders,
    coalesce(sum(o.amount_usd), 0.0) as total_spent,
    coalesce(avg(o.amount_usd), 0.0) as avg_order_value,
    coalesce(max(o.amount_usd), 0.0) as max_order_amount,
    case
        when coalesce(sum(o.amount_usd), 0.0) >= 100 then 'VIP'
        else 'Standard'
    end as customer_segment
from "dev"."main"."stg_users" u
left join "dev"."main"."stg_orders" o
    on u.user_id = o.user_id
group by
    u.user_id,
    u.user_name
  );
