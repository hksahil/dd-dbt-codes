{{ config(
    materialized='incremental',
    unique_key='order_id'
) }}

{#
  ==============================================================================
  CRITICAL CONCEPT: Two Separate Keys are Required for Incremental Models!
  
  1. The Merge Key (unique_key = 'order_id'):
     - Identifies the entity so the warehouse knows WHICH row to update or insert.
     
  2. The Watermark Key (order_date / updated_at):
     - Determines WHICH candidate rows to fetch from the raw source table.
     
  WHY max(order_id) BREAKS UPDATES:
  If order #101 already exists and changes its status or amount tomorrow, its 
  order_id is STILL 101. Filtering on "where order_id > max(order_id)" would 
  NEVER pull that updated record!
  
  CORRECT PATTERN:
  Filter by order_date (or updated_at) so both new orders AND modified orders 
  get processed and merged!
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
    -- Watermark filter: only fetch records modified on or after our table's latest date
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from {{ this }})
{% endif %}
