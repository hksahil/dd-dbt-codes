{{ config(materialized='view') }}

-- Upstream dependency: source('raw_duckdb', 'orders')
select
*
from {{ source('raw_duckdb', 'orders') }}
