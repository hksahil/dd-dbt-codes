{{ config(materialized='table') }}

select
    order_id,
    user_id,
    amount,
    status,
    'VALID_ORDER' as data_quality_flag,
    order_date
from {{ source('raw_duckdb', 'orders') }}
