{{ config(
    materialized='incremental',
    incremental_strategy='append'
) }}

{#
  ==============================================================================
  INCREMENTAL STRATEGY: APPEND
  
  HOW IT WORKS:
  - Simply appends new incoming rows to the table on each run without checking 
    for duplicates.
  - ONLY suitable for immutable logs (clickstream events, audit logs, IoT pings)
    where records are NEVER updated or mutated after creation!
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
    -- In an immutable table, filtering on max(order_id) or max(order_date) is valid
    where order_date > (select coalesce(max(order_date), '1970-01-01') from {{ this }})
{% endif %}
