{{ config(materialized='view') }}

-- Upstream dependency: source('raw_duckdb', 'users')
select
    id as user_id,
    name as user_name
from {{ source('raw_duckdb', 'users') }}
