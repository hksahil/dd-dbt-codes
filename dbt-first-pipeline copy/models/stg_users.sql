{{ config(materialized='view') }}

select
    id as customer_id,
    name as customer_name
from {{ source('raw_duckdb', 'users') }}
