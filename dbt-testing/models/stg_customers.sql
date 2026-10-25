{{ config(materialized='table') }}

select
    id as customer_id,
    name as customer_name,
    'active' as status
from users
