{{ config(materialized='view') }}

{# 
  Demonstrates using BOTH source and ref in the same model:
  1. source('raw_duckdb', 'users') pulls from the raw DuckDB table defined in sources.yml
  2. ref('demo_incremental') pulls from an existing dbt-managed model
#}

with raw_users as (
    -- Accessing raw source data
    select
        id as user_id,
        name as user_name
    from {{ source('raw_duckdb', 'users') }}
),

staged_orders as (
    -- Accessing a dbt model
    select
        order_id,
        user_id,
        amount
    from {{ ref('demo_incremental') }}
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
