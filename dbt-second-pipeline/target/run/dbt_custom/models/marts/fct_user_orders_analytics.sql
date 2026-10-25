
  
    
    
    create  table
      "dev"."main"."fct_user_orders_analytics__dbt_tmp"
  
    as (
      -- Advanced Analytics Mart: Materialized as a Table with Window Functions & DuckDB SQL


with user_orders as (
    select
        u.user_id,
        u.user_name,
        o.order_id,
        o.amount_usd,
        o.order_tier
    from "dev"."main"."stg_users" u
    join "dev"."main"."stg_orders" o
        on u.user_id = o.user_id
)

select
    user_id,
    user_name,
    order_id,
    amount_usd,
    order_tier,
    -- Window Function: Global ranking of orders by amount
    dense_rank() over (order by amount_usd desc) as order_amount_rank,
    -- Window Function: Cumulative running spend per customer
    sum(amount_usd) over (
        partition by user_id
        order by order_id
        rows between unbounded preceding and current row
    ) as running_spend,
    -- Analytical Window: Share of total company revenue (%)
    round(100.0 * amount_usd / sum(amount_usd) over (), 2)
        as pct_of_total_revenue,
    -- DuckDB Modern SQL: List of order IDs per customer
    list(order_id) over (partition by user_id) as customer_all_order_ids
from user_orders
    );
  
    
  