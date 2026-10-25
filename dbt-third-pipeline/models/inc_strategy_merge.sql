{{ config(
    materialized='incremental',
    incremental_strategy='merge',
    unique_key='order_id'
) }}

{#
  ==============================================================================
  INCREMENTAL STRATEGY: MERGE (UPSERT)
  
  HOW IT WORKS:
  - If incoming order_id matches an existing target order_id -> UPDATE row.
  - If incoming order_id does NOT exist in target -> INSERT new row.
  
  WATERMARK REQUIREMENT:
  Must filter on date/timestamp (order_date), NEVER max(order_id), so that 
  upstream mutations to existing orders are included in the incoming batch!
  ==============================================================================
#}

select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders

{% if is_incremental() %}
    -- Filter candidate batch using timestamp watermark
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from {{ this }})
{% endif %}
