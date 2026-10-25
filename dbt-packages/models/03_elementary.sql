{{ config(materialized='table') }}

select
    order_id,
    user_id,
    amount,
    status,
    order_date,
    current_timestamp as observed_at
from {{ source('raw_duckdb', 'orders') }}
