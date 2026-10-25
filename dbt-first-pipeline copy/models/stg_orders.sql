{{ config(materialized='view') }}

select
    order_id,
    user_id as customer_id,
    amount,
    status as order_status,
    order_date
from {{ source('raw_duckdb', 'orders') }}
